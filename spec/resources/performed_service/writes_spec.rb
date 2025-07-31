require 'rails_helper'

RSpec.describe PerformedServiceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'performed_services',
          attributes: attributes_for(:performed_service)
        }
      }
    end

    let(:instance) do
      PerformedServiceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PerformedService.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:performed_service) { create(:performed_service) }

    let(:payload) do
      {
        data: {
          id: performed_service.id.to_s,
          type: 'performed_services',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PerformedServiceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { performed_service.reload.updated_at }
      # .and change { performed_service.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:performed_service) { create(:performed_service) }

    let(:instance) do
      PerformedServiceResource.find(id: performed_service.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PerformedService.count }.by(-1)
    end
  end
end
