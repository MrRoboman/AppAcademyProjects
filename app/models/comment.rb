class Comment < ActiveRecord::Base
  validates :title, :body, null: false
  belongs_to :commentable, polymorphic: true
end
