require 'rails_helper'

RSpec.describe "performed_services#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/performed_services/#{performed_service.id}"
  end

  describe 'basic destroy' do
    let!(:performed_service) { create(:performed_service) }

    it 'updates the resource' do
      expect(PerformedServiceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { PerformedService.count }.by(-1)
      expect { performed_service.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
