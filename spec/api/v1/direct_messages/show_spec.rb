require "rails_helper"

RSpec.describe "direct_messages#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/direct_messages/#{direct_message.id}", params: params
  end

  describe "basic fetch" do
    let!(:direct_message) { create(:direct_message) }

    it "works" do
      expect(DirectMessageResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("direct_messages")
      expect(d.id).to eq(direct_message.id)
    end
  end
end
