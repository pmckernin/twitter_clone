require "rails_helper"

RSpec.describe "direct_messages#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/direct_messages/#{direct_message.id}", payload
  end

  describe "basic update" do
    let!(:direct_message) { create(:direct_message) }

    let(:payload) do
      {
        data: {
          id: direct_message.id.to_s,
          type: "direct_messages",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DirectMessageResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { direct_message.reload.attributes }
    end
  end
end
