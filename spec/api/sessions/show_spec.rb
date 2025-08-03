require 'rails_helper'

RSpec.describe "sessions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/sessions/#{session.id}", params: params
  end

  describe 'basic fetch' do
    let!(:session) { create(:session) }

    it 'works' do
      expect(SessionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('sessions')
      expect(d.id).to eq(session.id)
    end
  end
end
