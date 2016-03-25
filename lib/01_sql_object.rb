# require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL).first.map(&:to_sym)
    SELECT
      *
    FROM
      #{table_name}
    SQL
  end

  def self.finalize!
    columns.each do |col_name|
      #getters
      define_method(col_name) do
        attributes[col_name]
      end

      #setters
      define_method("#{col_name}=") do |val|
        attributes[col_name] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_names ||= {}
    @table_names[self] = table_name
  end

  def self.table_name
    @table_names ||= {}
    @table_names[self] ||= ActiveSupport::Inflector.pluralize(self.to_s.downcase)
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |params|
      self.new(params)
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL

    return nil if results.empty?
    parse_all(results).first
  end

  def initialize(params = {})
    params.each do |key, val|
      raise "unknown attribute '#{key}'" unless respond_to?(key)
      self.send("#{key}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    columns = self.class.columns.drop(1).join(', ')
    attributes = attribute_values.map {|v| "'#{v}'"}.join(', ')
    DBConnection.execute(<<-SQL)
      INSERT INTO
        #{self.class.table_name} (#{columns})
      VALUES
        (#{attributes})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns.drop(1)
    key_vals = columns.zip(attribute_values.drop(1))
    set_str = key_vals.map {|k, v| "#{k} = '#{v}'"}.join(', ')

    DBConnection.execute(<<-SQL, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_str}
      WHERE
        id = ?
    SQL
  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
  end
end
