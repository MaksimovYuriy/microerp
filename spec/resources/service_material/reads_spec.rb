require 'rails_helper'

RSpec.describe ServiceMaterialResource, type: :resource do
  describe 'serialization' do
    let!(:service_material) { create(:service_material) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(service_material.id)
      expect(data.jsonapi_type).to eq('service_materials')
    end
  end

  describe 'filtering' do
    let!(:service_material1) { create(:service_material) }
    let!(:service_material2) { create(:service_material) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: service_material2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([service_material2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:service_material1) { create(:service_material) }
      let!(:service_material2) { create(:service_material) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            service_material1.id,
            service_material2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            service_material2.id,
            service_material1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
