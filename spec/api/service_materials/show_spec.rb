require 'rails_helper'

RSpec.describe "service_materials#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/service_materials/#{service_material.id}", params: params
  end

  describe 'basic fetch' do
    let!(:service_material) { create(:service_material) }

    it 'works' do
      expect(ServiceMaterialResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('service_materials')
      expect(d.id).to eq(service_material.id)
    end
  end
end
