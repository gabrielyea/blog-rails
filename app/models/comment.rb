class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: { message: 'Comment needs a message' }
  after_save :update_post_comment_counter
  after_destroy :decrement_user_comment_counter

  private

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end

  def decrement_user_comment_counter
    post.decrement!(:comments_counter)
  end
end
