class DirectMessage < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :sender_id, :presence => true

  # Scopes

  def to_s
    sender.to_s
  end

end
