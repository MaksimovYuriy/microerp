require 'rails_helper'

RSpec.describe "service_material_logs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/service_material_logs/#{service_material_log.id}", params: params
  end

  describe 'basic fetch' do
    let!(:service_material_log) { create(:service_material_log) }

    it 'works' do
      expect(ServiceMaterialLogResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('service_material_logs')
      expect(d.id).to eq(service_material_log.id)
    end
  end
end
