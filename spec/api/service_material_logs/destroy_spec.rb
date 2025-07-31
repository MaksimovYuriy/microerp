require 'rails_helper'

RSpec.describe "service_material_logs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/service_material_logs/#{service_material_log.id}"
  end

  describe 'basic destroy' do
    let!(:service_material_log) { create(:service_material_log) }

    it 'updates the resource' do
      expect(ServiceMaterialLogResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ServiceMaterialLog.count }.by(-1)
      expect { service_material_log.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
