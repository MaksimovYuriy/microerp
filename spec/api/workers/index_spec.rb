require 'rails_helper'

RSpec.describe "workers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/workers", params: params
  end

  describe 'basic fetch' do
    let!(:worker1) { create(:worker) }
    let!(:worker2) { create(:worker) }

    it 'works' do
      expect(WorkerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['workers'])
      expect(d.map(&:id)).to match_array([worker1.id, worker2.id])
    end
  end
end
