require 'rails_helper'

RSpec.describe "canceled_services#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/canceled_services/#{canceled_service.id}", payload
  end

  describe 'basic update' do
    let!(:canceled_service) { create(:canceled_service) }

    let(:payload) do
      {
        data: {
          id: canceled_service.id.to_s,
          type: 'canceled_services',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CanceledServiceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { canceled_service.reload.attributes }
    end
  end
end
