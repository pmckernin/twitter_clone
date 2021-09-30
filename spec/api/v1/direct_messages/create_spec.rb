require 'rails_helper'

RSpec.describe "direct_messages#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/direct_messages", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'direct_messages',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(DirectMessageResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { DirectMessage.count }.by(1)
    end
  end
end
