require 'rails_helper'

RSpec.describe "sessions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/sessions/#{session.id}"
  end

  describe 'basic destroy' do
    let!(:session) { create(:session) }

    it 'updates the resource' do
      expect(SessionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Session.count }.by(-1)
      expect { session.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
