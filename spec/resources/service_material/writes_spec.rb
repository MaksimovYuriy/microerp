require 'rails_helper'

RSpec.describe ServiceMaterialResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'service_materials',
          attributes: attributes_for(:service_material)
        }
      }
    end

    let(:instance) do
      ServiceMaterialResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ServiceMaterial.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:service_material) { create(:service_material) }

    let(:payload) do
      {
        data: {
          id: service_material.id.to_s,
          type: 'service_materials',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ServiceMaterialResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { service_material.reload.updated_at }
      # .and change { service_material.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:service_material) { create(:service_material) }

    let(:instance) do
      ServiceMaterialResource.find(id: service_material.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ServiceMaterial.count }.by(-1)
    end
  end
end
