require 'rails_helper'

RSpec.describe WorkerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'workers',
          attributes: attributes_for(:worker)
        }
      }
    end

    let(:instance) do
      WorkerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Worker.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:worker) { create(:worker) }

    let(:payload) do
      {
        data: {
          id: worker.id.to_s,
          type: 'workers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      WorkerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { worker.reload.updated_at }
      # .and change { worker.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:worker) { create(:worker) }

    let(:instance) do
      WorkerResource.find(id: worker.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Worker.count }.by(-1)
    end
  end
end
