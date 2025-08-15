require 'rails_helper'

RSpec.describe CanceledServiceResource, type: :resource do
  describe 'serialization' do
    let!(:canceled_service) { create(:canceled_service) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(canceled_service.id)
      expect(data.jsonapi_type).to eq('canceled_services')
    end
  end

  describe 'filtering' do
    let!(:canceled_service1) { create(:canceled_service) }
    let!(:canceled_service2) { create(:canceled_service) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: canceled_service2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([canceled_service2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:canceled_service1) { create(:canceled_service) }
      let!(:canceled_service2) { create(:canceled_service) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            canceled_service1.id,
            canceled_service2.id
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
            canceled_service2.id,
            canceled_service1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
