require 'rails_helper'

RSpec.describe "workers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/workers/#{worker.id}", params: params
  end

  describe 'basic fetch' do
    let!(:worker) { create(:worker) }

    it 'works' do
      expect(WorkerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('workers')
      expect(d.id).to eq(worker.id)
    end
  end
end
