require 'rails_helper'

RSpec.describe "canceled_services#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/canceled_services", params: params
  end

  describe 'basic fetch' do
    let!(:canceled_service1) { create(:canceled_service) }
    let!(:canceled_service2) { create(:canceled_service) }

    it 'works' do
      expect(CanceledServiceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['canceled_services'])
      expect(d.map(&:id)).to match_array([canceled_service1.id, canceled_service2.id])
    end
  end
end
