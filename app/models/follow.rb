class Follow < ApplicationRecord
  # Direct associations

  belongs_to :user,
             foreign_key: "following_id",
             counter_cache: :followings_count

  belongs_to :leader,
             class_name: "User",
             foreign_key: "follower_id",
             counter_cache: :followers_count

  # Indirect associations

  # Validations

  validates :follower_id, uniqueness: { scope: [:following_id] }

  validates :follower_id, presence: true

  validates :following_id, uniqueness: { scope: [:follower_id] }

  validates :following_id, presence: true

  # Scopes

  def to_s
    leader.to_s
  end
end
