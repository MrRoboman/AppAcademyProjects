require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    name = name.to_s
    f_key  = options[:foreign_key] || "#{name.underscore}_id".to_sym
    c_name = options[:class_name]  || name.camelcase
    p_key  = options[:primary_key] || :id

    self.foreign_key = f_key
    self.class_name  = c_name
    self.primary_key = p_key
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    name = name.to_s
    self_class_name = self_class_name.to_s

    f_key  = options[:foreign_key] || "#{self_class_name.underscore}_id".to_sym
    c_name = options[:class_name]  || name.singularize.camelcase
    p_key  = options[:primary_key] || :id

    self.foreign_key = f_key
    self.class_name  = c_name
    self.primary_key = p_key
  end
end


module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    assoc_options = options

    define_method(name) do
      f_key = send(options.foreign_key)
      model = options.model_class
      p_key = options.primary_key

      model.where({p_key => f_key}).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self, options)

    define_method(name) do
      model = options.model_class
      p_key = send(options.primary_key)
      f_key = options.foreign_key

      model.where({f_key => p_key})
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
