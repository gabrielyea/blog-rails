class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def take_five_recent
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_post_counter
    author.update(post_counter: author.posts.count)
  end
end
