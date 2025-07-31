require 'rails_helper'

RSpec.describe "service_materials#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/service_materials", params: params
  end

  describe 'basic fetch' do
    let!(:service_material1) { create(:service_material) }
    let!(:service_material2) { create(:service_material) }

    it 'works' do
      expect(ServiceMaterialResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['service_materials'])
      expect(d.map(&:id)).to match_array([service_material1.id, service_material2.id])
    end
  end
end
