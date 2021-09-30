class FollowResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :follower_id, :integer
  attribute :following_id, :integer

  # Direct associations

  belongs_to :leader,
             resource: UserResource,
             foreign_key: :follower_id

  # Indirect associations

end
