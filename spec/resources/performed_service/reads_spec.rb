require 'rails_helper'

RSpec.describe PerformedServiceResource, type: :resource do
  describe 'serialization' do
    let!(:performed_service) { create(:performed_service) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(performed_service.id)
      expect(data.jsonapi_type).to eq('performed_services')
    end
  end

  describe 'filtering' do
    let!(:performed_service1) { create(:performed_service) }
    let!(:performed_service2) { create(:performed_service) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: performed_service2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([performed_service2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:performed_service1) { create(:performed_service) }
      let!(:performed_service2) { create(:performed_service) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            performed_service1.id,
            performed_service2.id
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
            performed_service2.id,
            performed_service1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
