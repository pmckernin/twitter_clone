require 'rails_helper'

RSpec.describe Follow, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:follower_id) }

    it { should validate_uniqueness_of(:following_id).scoped_to(:follower_id) }

    it { should validate_presence_of(:following_id) }

    end
end
