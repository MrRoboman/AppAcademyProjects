class Contact < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  belongs_to :owner, foreign_key: :user_id, class_name: :User
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user
  has_many :comments, as: :commentable
end
