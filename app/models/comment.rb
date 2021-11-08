class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_commit :update_post_comment_counter, on: :update

  private

  def update_post_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
