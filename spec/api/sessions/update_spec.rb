require 'rails_helper'

RSpec.describe "sessions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/sessions/#{session.id}", payload
  end

  describe 'basic update' do
    let!(:session) { create(:session) }

    let(:payload) do
      {
        data: {
          id: session.id.to_s,
          type: 'sessions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SessionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { session.reload.attributes }
    end
  end
end
