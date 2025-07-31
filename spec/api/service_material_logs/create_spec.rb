require 'rails_helper'

RSpec.describe "service_material_logs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/service_material_logs", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:service_material_log)
    end
    let(:payload) do
      {
        data: {
          type: 'service_material_logs',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ServiceMaterialLogResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ServiceMaterialLog.count }.by(1)
    end
  end
end
