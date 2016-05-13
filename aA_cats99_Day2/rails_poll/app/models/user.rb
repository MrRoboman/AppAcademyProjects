# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :name, presence: true

  has_many(
    :polls,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: "Poll"
  )

  has_many(
    :responses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "Response"
  )

  has_many(
    :answer_choices,
    through: :responses,
    source: :answer_choice
  )

end
