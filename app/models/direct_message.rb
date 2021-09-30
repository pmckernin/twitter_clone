class DirectMessage < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             class_name: "User",
             counter_cache: :recieved_messages_count

  belongs_to :sender,
             class_name: "User",
             counter_cache: :sent_messages_count

  # Indirect associations

  # Validations

  validates :body, presence: true

  validates :recipient_id, presence: true

  validates :sender_id, presence: true

  # Scopes

  def to_s
    sender.to_s
  end
end
