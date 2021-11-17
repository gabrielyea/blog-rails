class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: { message: 'Title cannot be empty' }
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_user_post_counter
  after_destroy :decrement_user_post_counter

  def take_five_recent
    comments.order(created_at: :desc).limit(5)
  end

  def show_all
    comments
  end

  private

  def update_user_post_counter
    author.increment!(:post_counter)
  end

  def decrement_user_post_counter
    author.decrement!(:post_counter)
  end
end
