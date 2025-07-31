require 'rails_helper'

RSpec.describe "performed_services#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/performed_services/#{performed_service.id}", payload
  end

  describe 'basic update' do
    let!(:performed_service) { create(:performed_service) }

    let(:payload) do
      {
        data: {
          id: performed_service.id.to_s,
          type: 'performed_services',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PerformedServiceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { performed_service.reload.attributes }
    end
  end
end
