require 'rails_helper'

RSpec.describe SessionResource, type: :resource do
  describe 'serialization' do
    let!(:session) { create(:session) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(session.id)
      expect(data.jsonapi_type).to eq('sessions')
    end
  end

  describe 'filtering' do
    let!(:session1) { create(:session) }
    let!(:session2) { create(:session) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: session2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([session2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:session1) { create(:session) }
      let!(:session2) { create(:session) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            session1.id,
            session2.id
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
            session2.id,
            session1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
