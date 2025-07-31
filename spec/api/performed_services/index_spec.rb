require 'rails_helper'

RSpec.describe "performed_services#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/performed_services", params: params
  end

  describe 'basic fetch' do
    let!(:performed_service1) { create(:performed_service) }
    let!(:performed_service2) { create(:performed_service) }

    it 'works' do
      expect(PerformedServiceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['performed_services'])
      expect(d.map(&:id)).to match_array([performed_service1.id, performed_service2.id])
    end
  end
end
