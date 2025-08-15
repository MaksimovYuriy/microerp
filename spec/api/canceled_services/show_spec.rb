require 'rails_helper'

RSpec.describe "canceled_services#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/canceled_services/#{canceled_service.id}", params: params
  end

  describe 'basic fetch' do
    let!(:canceled_service) { create(:canceled_service) }

    it 'works' do
      expect(CanceledServiceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('canceled_services')
      expect(d.id).to eq(canceled_service.id)
    end
  end
end
