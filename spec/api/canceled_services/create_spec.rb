require 'rails_helper'

RSpec.describe "canceled_services#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/canceled_services", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:canceled_service)
    end
    let(:payload) do
      {
        data: {
          type: 'canceled_services',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CanceledServiceResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CanceledService.count }.by(1)
    end
  end
end
