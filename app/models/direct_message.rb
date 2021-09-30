class DirectMessage < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipient_id, :presence => true

  validates :sender_id, :presence => true

  # Scopes

  def to_s
    sender.to_s
  end

end
