require 'rails_helper'

RSpec.describe ServiceMaterialLogResource, type: :resource do
  describe 'serialization' do
    let!(:service_material_log) { create(:service_material_log) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(service_material_log.id)
      expect(data.jsonapi_type).to eq('service_material_logs')
    end
  end

  describe 'filtering' do
    let!(:service_material_log1) { create(:service_material_log) }
    let!(:service_material_log2) { create(:service_material_log) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: service_material_log2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([service_material_log2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:service_material_log1) { create(:service_material_log) }
      let!(:service_material_log2) { create(:service_material_log) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            service_material_log1.id,
            service_material_log2.id
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
            service_material_log2.id,
            service_material_log1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
