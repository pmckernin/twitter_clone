class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :followings,
             resource: FollowResource,
             foreign_key: :following_id

  has_many   :recieved_messages,
             resource: DirectMessageResource,
             foreign_key: :recipient_id

  has_many   :liked_posts,
             resource: LikeResource

  has_many   :sent_messages,
             resource: DirectMessageResource,
             foreign_key: :sender_id

  has_many   :followers,
             resource: FollowResource,
             foreign_key: :follower_id

  has_many   :posts

  # Indirect associations

  many_to_many :favorites,
               resource: PostResource

end
