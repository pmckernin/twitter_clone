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
end
