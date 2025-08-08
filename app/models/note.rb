class Note < ApplicationRecord
  belongs_to :client
  belongs_to :service
  belongs_to :worker

  validates :client, presence: true
  validates :service, presence: true
  validates :worker, presence: true
  validates :date, presence: true

  include AASM

  aasm column: 'state' do
    state :planned, initial: true
    state :providing, :completed, :canceled

    event :start do
      transitions from: :planned, to: :providing 
    end

    event :complete do
      transitions from: :providing, to: :completed
    end

    event :cancel do
      transitions from: [:planned, :providing], to: :canceled
    end
  end

end
