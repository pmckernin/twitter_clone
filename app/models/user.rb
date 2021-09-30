class User < ApplicationRecord
  # Direct associations

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
