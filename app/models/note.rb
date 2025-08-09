class Note < ApplicationRecord
  belongs_to :client
  belongs_to :service
  belongs_to :worker

  validates :client, presence: true, uniqueness: { scope: :date, message: 'The client has already signed up for this time!' }
  validates :service, presence: true
  validates :worker, presence: true
  validates :date, presence: true, uniqueness: true

  validate :date_cannot_be_in_the_past

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

  private

  def date_cannot_be_in_the_past
    if date.to_date < Date.today
      errors.add(:base, 'Cannot be in the past!')
    end
  end

end
