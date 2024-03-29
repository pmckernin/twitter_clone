require "rails_helper"

RSpec.describe Follow, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should belong_to(:leader) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it {
      should validate_uniqueness_of(:follower_id).scoped_to(:following_id)
    }

    it { should validate_presence_of(:follower_id) }

    it { should validate_uniqueness_of(:following_id).scoped_to(:follower_id) }

    it { should validate_presence_of(:following_id) }
  end
end
