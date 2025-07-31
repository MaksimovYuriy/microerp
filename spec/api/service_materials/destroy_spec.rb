require 'rails_helper'

RSpec.describe "service_materials#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/service_materials/#{service_material.id}"
  end

  describe 'basic destroy' do
    let!(:service_material) { create(:service_material) }

    it 'updates the resource' do
      expect(ServiceMaterialResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ServiceMaterial.count }.by(-1)
      expect { service_material.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
