require 'rails_helper'

RSpec.describe "service_materials#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/service_materials", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:service_material)
    end
    let(:payload) do
      {
        data: {
          type: 'service_materials',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ServiceMaterialResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ServiceMaterial.count }.by(1)
    end
  end
end
