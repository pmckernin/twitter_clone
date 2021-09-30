require 'rails_helper'

RSpec.describe DirectMessageResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'direct_messages',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DirectMessageResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { DirectMessage.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:direct_message) { create(:direct_message) }

    let(:payload) do
      {
        data: {
          id: direct_message.id.to_s,
          type: 'direct_messages',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DirectMessageResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { direct_message.reload.updated_at }
      # .and change { direct_message.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:direct_message) { create(:direct_message) }

    let(:instance) do
      DirectMessageResource.find(id: direct_message.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { DirectMessage.count }.by(-1)
    end
  end
end
