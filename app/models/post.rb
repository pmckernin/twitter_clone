class Post < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
