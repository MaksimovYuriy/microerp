require 'rails_helper'

RSpec.describe WorkerResource, type: :resource do
  describe 'serialization' do
    let!(:worker) { create(:worker) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(worker.id)
      expect(data.jsonapi_type).to eq('workers')
    end
  end

  describe 'filtering' do
    let!(:worker1) { create(:worker) }
    let!(:worker2) { create(:worker) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: worker2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([worker2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:worker1) { create(:worker) }
      let!(:worker2) { create(:worker) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            worker1.id,
            worker2.id
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
            worker2.id,
            worker1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
