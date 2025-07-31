require 'rails_helper'

RSpec.describe "service_material_logs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/service_material_logs/#{service_material_log.id}", payload
  end

  describe 'basic update' do
    let!(:service_material_log) { create(:service_material_log) }

    let(:payload) do
      {
        data: {
          id: service_material_log.id.to_s,
          type: 'service_material_logs',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ServiceMaterialLogResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { service_material_log.reload.attributes }
    end
  end
end
