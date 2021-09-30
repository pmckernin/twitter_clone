class Like < ApplicationRecord
  # Direct associations

  belongs_to :post,
             counter_cache: true

  belongs_to :user,
             counter_cache: :liked_posts_count

  # Indirect associations

  # Validations

  validates :post_id, uniqueness: { scope: [:user_id] }

  validates :post_id, presence: true

  validates :user_id, presence: true

  # Scopes

  def to_s
    user.to_s
  end
end
