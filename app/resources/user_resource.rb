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

  has_many :my_follows, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.my_follows.map(&:id))
      end
    end
  end

  has_many :my_followers, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.my_followers.map(&:id))
      end
    end
  end

  many_to_many :favorites,
               resource: PostResource


  filter :following_id, :integer do
    eq do |scope, value|
      scope.eager_load(:my_follows).where(:follows => {:following_id => value})
    end
  end

  filter :follower_id, :integer do
    eq do |scope, value|
      scope.eager_load(:my_followers).where(:follows => {:follower_id => value})
    end
  end
end
