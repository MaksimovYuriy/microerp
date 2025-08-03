require 'rails_helper'

RSpec.describe "sessions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/sessions", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:session)
    end
    let(:payload) do
      {
        data: {
          type: 'sessions',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SessionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Session.count }.by(1)
    end
  end
end
