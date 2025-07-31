require 'rails_helper'

RSpec.describe ServiceMaterialLogResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'service_material_logs',
          attributes: attributes_for(:service_material_log)
        }
      }
    end

    let(:instance) do
      ServiceMaterialLogResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ServiceMaterialLog.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:service_material_log) { create(:service_material_log) }

    let(:payload) do
      {
        data: {
          id: service_material_log.id.to_s,
          type: 'service_material_logs',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ServiceMaterialLogResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { service_material_log.reload.updated_at }
      # .and change { service_material_log.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:service_material_log) { create(:service_material_log) }

    let(:instance) do
      ServiceMaterialLogResource.find(id: service_material_log.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ServiceMaterialLog.count }.by(-1)
    end
  end
end
