require 'rails_helper'

RSpec.describe "performed_services#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/performed_services/#{performed_service.id}", params: params
  end

  describe 'basic fetch' do
    let!(:performed_service) { create(:performed_service) }

    it 'works' do
      expect(PerformedServiceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('performed_services')
      expect(d.id).to eq(performed_service.id)
    end
  end
end
