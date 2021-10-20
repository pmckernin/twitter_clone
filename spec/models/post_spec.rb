require "rails_helper"

RSpec.describe Post, type: :model do
  describe "Direct Associations" do
    it { should have_many(:likes) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_many(:fans) }

    it { should have_many(:my_followers) }
  end

  describe "Validations" do
    it { should validate_presence_of(:body) }
  end
end
