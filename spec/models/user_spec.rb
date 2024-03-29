require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:followings) }

    it { should have_many(:recieved_messages) }

    it { should have_many(:liked_posts) }

    it { should have_many(:sent_messages) }

    it { should have_many(:followers) }

    it { should have_many(:posts) }
  end

  describe "InDirect Associations" do
    it { should have_many(:my_follows) }

    it { should have_many(:my_followers) }

    it { should have_many(:favorites) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }
  end
end
