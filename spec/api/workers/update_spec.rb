require 'rails_helper'

RSpec.describe "workers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/workers/#{worker.id}", payload
  end

  describe 'basic update' do
    let!(:worker) { create(:worker) }

    let(:payload) do
      {
        data: {
          id: worker.id.to_s,
          type: 'workers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(WorkerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { worker.reload.attributes }
    end
  end
end
