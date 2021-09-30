require 'rails_helper'

RSpec.describe DirectMessage, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sender) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:recipient_id) }

    it { should validate_presence_of(:sender_id) }

    end
end
