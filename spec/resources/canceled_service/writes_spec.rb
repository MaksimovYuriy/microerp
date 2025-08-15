require 'rails_helper'

RSpec.describe CanceledServiceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'canceled_services',
          attributes: attributes_for(:canceled_service)
        }
      }
    end

    let(:instance) do
      CanceledServiceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { CanceledService.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:canceled_service) { create(:canceled_service) }

    let(:payload) do
      {
        data: {
          id: canceled_service.id.to_s,
          type: 'canceled_services',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CanceledServiceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { canceled_service.reload.updated_at }
      # .and change { canceled_service.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:canceled_service) { create(:canceled_service) }

    let(:instance) do
      CanceledServiceResource.find(id: canceled_service.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { CanceledService.count }.by(-1)
    end
  end
end
