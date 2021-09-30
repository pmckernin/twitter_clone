class Post < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
