class PostResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :body, :string
  attribute :reply_to_id, :integer
  attribute :repost_of_id, :integer

  # Direct associations

  has_many   :likes

  belongs_to :user

  # Indirect associations

  many_to_many :fans,
               resource: UserResource

  has_many :my_followers, resource: UserResource, primary_key: :user_id do
    assign_each do |post, users|
      users.select do |u|
        u.id.in?(post.my_followers.map(&:id))
      end
    end
  end

  filter :follower_id, :integer do
    eq do |scope, value|
      scope.eager_load(:my_followers).where(follows: { follower_id: value })
    end
  end
end
