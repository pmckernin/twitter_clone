class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :followings,
             :class_name => "Follow",
             :foreign_key => "following_id",
             :dependent => :destroy

  has_many   :recieved_messages,
             :class_name => "DirectMessage",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :liked_posts,
             :class_name => "Like",
             :dependent => :destroy

  has_many   :sent_messages,
             :class_name => "DirectMessage",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :followers,
             :class_name => "Follow",
             :foreign_key => "follower_id",
             :dependent => :destroy

  has_many   :posts,
             :dependent => :destroy

  # Indirect associations

  has_many   :my_follows,
             :through => :followers,
             :source => :user

  has_many   :my_followers,
             :through => :followings,
             :source => :leader

  has_many   :favorites,
             :through => :liked_posts,
             :source => :post

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
