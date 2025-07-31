require 'rails_helper'

RSpec.describe "workers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/workers", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:worker)
    end
    let(:payload) do
      {
        data: {
          type: 'workers',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(WorkerResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Worker.count }.by(1)
    end
  end
end
