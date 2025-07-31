require 'rails_helper'

RSpec.describe "performed_services#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/performed_services", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:performed_service)
    end
    let(:payload) do
      {
        data: {
          type: 'performed_services',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(PerformedServiceResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { PerformedService.count }.by(1)
    end
  end
end
