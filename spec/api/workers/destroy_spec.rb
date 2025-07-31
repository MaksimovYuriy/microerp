require 'rails_helper'

RSpec.describe "workers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/workers/#{worker.id}"
  end

  describe 'basic destroy' do
    let!(:worker) { create(:worker) }

    it 'updates the resource' do
      expect(WorkerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Worker.count }.by(-1)
      expect { worker.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
