# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  COLORS = ['calico', 'orange', 'black', 'white', 'grey']
  SEX = ['M', 'F', 'T', 'A']

  validates :birth_date, :name, presence: true
  validates :color, inclusion: COLORS, presence: true
  validates :sex, inclusion: SEX, presence: true

  has_many :rental_requests, foreign_key: :cat_id, class_name: :CatRentalRequest, dependent: :destroy

  def self.sexes
    {'M' => 'Male', 'F' => 'Female', 'T' => 'Trans', 'A' => "Asexual"}
  end

  def self.colors
    COLORS
  end

  def self.sexes_arr
    SEX
  end

  def self.random_cat_url
    Cat.all.sample.image_url
  end

  def age
    # Date.today - self.birth_date
    # Date.today.year - self.birth_date.year

    age = Date.today.year - birth_date.year
    age -= 1 if Date.today < birth_date + age.years
    age
  end

  def self.meow!
    date = Faker::Date.between(10.years.ago, Date.today)
    name = Faker::Superhero.name
    color = COLORS.sample
    sex = SEX.sample
    Cat.new(birth_date: date, name: name, color: color, sex: sex)
  end
end
