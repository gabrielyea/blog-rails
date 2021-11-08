class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_commit :update_post_likes_counter, on: :update

  private

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
