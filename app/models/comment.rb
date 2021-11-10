class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_commit :update_post_comment_counter, on: :update

  private

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
