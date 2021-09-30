class Follow < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :follower_id, :presence => true

  validates :following_id, :uniqueness => { :scope => [:follower_id] }

  validates :following_id, :presence => true

  # Scopes

  def to_s
    leader.to_s
  end

end
