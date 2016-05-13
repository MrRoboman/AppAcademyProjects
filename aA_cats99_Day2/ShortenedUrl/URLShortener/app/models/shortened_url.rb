# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, :long_url, :presence => true
  validates :short_url, :presence => true, :uniqueness => true

  def self.random_code
    short_url = nil
    while short_url.nil? || self.exists?(:short_url => short_url)
      short_url = SecureRandom::urlsafe_base64
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user_id,long_url)
    ShortenedUrl.create!(submitter_id: user_id,long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  belongs_to(
  :user,
  class_name: :User,
  foreign_key: :submitter_id,
  primary_key: :id
  )

  has_many(
  :visits,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :short_url_id
  )

  has_many(
  :visitors,
  Proc.new{distinct},
  through: :visits,
  source: :user
  )


  def num_clicks
    visitors.count
  end

  def num_uniques
    visitors.distinct.count
  end

  # def num_recent_uniques
  #   visitors.where(created_at: 10.minutes.ago..Time.now).distinct.count
  # end
end
