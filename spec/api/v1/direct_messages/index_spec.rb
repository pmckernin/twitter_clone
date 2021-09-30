require "rails_helper"

RSpec.describe "direct_messages#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/direct_messages", params: params
  end

  describe "basic fetch" do
    let!(:direct_message1) { create(:direct_message) }
    let!(:direct_message2) { create(:direct_message) }

    it "works" do
      expect(DirectMessageResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["direct_messages"])
      expect(d.map(&:id)).to match_array([direct_message1.id,
                                          direct_message2.id])
    end
  end
end
