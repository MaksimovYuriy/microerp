require 'rails_helper'

RSpec.describe "service_material_logs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/service_material_logs", params: params
  end

  describe 'basic fetch' do
    let!(:service_material_log1) { create(:service_material_log) }
    let!(:service_material_log2) { create(:service_material_log) }

    it 'works' do
      expect(ServiceMaterialLogResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['service_material_logs'])
      expect(d.map(&:id)).to match_array([service_material_log1.id, service_material_log2.id])
    end
  end
end
