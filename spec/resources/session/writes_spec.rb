require 'rails_helper'

RSpec.describe SessionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'sessions',
          attributes: attributes_for(:session)
        }
      }
    end

    let(:instance) do
      SessionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Session.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:session) { create(:session) }

    let(:payload) do
      {
        data: {
          id: session.id.to_s,
          type: 'sessions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SessionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { session.reload.updated_at }
      # .and change { session.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:session) { create(:session) }

    let(:instance) do
      SessionResource.find(id: session.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Session.count }.by(-1)
    end
  end
end
