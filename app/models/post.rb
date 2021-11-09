class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_commit :update_user_post_counter

  def take_five_recent
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_post_counter
    author.update(post_counter: author.posts.count)
  end
end
