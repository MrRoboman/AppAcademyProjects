# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true


  has_many(
  :submitted_urls,
  foreign_key: :submitter_id,
  primary_key: :id,
  class_name: :ShortenedUrls
  )

  has_many(
  :visits,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :visitor_id
  )

  has_many(
  :visited_urls,
  through: :visits,
  source: :short_url
  )


end
