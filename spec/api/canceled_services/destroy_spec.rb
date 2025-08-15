require 'rails_helper'

RSpec.describe "canceled_services#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/canceled_services/#{canceled_service.id}"
  end

  describe 'basic destroy' do
    let!(:canceled_service) { create(:canceled_service) }

    it 'updates the resource' do
      expect(CanceledServiceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CanceledService.count }.by(-1)
      expect { canceled_service.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
