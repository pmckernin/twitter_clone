class Like < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :post_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
