class User < ApplicationRecord
  ROLES = %i[admin default].freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  def take_three_recent
    posts.order(created_at: :desc).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
