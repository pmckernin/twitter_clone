require "rails_helper"

RSpec.describe DirectMessageResource, type: :resource do
  describe "serialization" do
    let!(:direct_message) { create(:direct_message) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(direct_message.id)
      expect(data.jsonapi_type).to eq("direct_messages")
    end
  end

  describe "filtering" do
    let!(:direct_message1) { create(:direct_message) }
    let!(:direct_message2) { create(:direct_message) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: direct_message2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([direct_message2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:direct_message1) { create(:direct_message) }
      let!(:direct_message2) { create(:direct_message) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      direct_message1.id,
                                      direct_message2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      direct_message2.id,
                                      direct_message1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
