require 'rails_helper'

RSpec.describe "sessions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/sessions", params: params
  end

  describe 'basic fetch' do
    let!(:session1) { create(:session) }
    let!(:session2) { create(:session) }

    it 'works' do
      expect(SessionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['sessions'])
      expect(d.map(&:id)).to match_array([session1.id, session2.id])
    end
  end
end
