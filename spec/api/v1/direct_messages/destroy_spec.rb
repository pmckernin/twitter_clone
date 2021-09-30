require "rails_helper"

RSpec.describe "direct_messages#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/direct_messages/#{direct_message.id}"
  end

  describe "basic destroy" do
    let!(:direct_message) { create(:direct_message) }

    it "updates the resource" do
      expect(DirectMessageResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { DirectMessage.count }.by(-1)
      expect { direct_message.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
