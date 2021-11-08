class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def take3
    comments.order(created_at: :desc).limit(3)
  end
end
