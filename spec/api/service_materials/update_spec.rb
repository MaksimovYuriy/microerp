require 'rails_helper'

RSpec.describe "service_materials#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/service_materials/#{service_material.id}", payload
  end

  describe 'basic update' do
    let!(:service_material) { create(:service_material) }

    let(:payload) do
      {
        data: {
          id: service_material.id.to_s,
          type: 'service_materials',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ServiceMaterialResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { service_material.reload.attributes }
    end
  end
end
