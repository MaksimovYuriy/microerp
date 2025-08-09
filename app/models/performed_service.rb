class PerformedService < ApplicationRecord
  belongs_to :client
  belongs_to :service
  belongs_to :worker

  validates :client, presence: true
  validates :service, presence: true
  validates :worker, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :payment_method, presence: true
  validates :date, presence: true, uniqueness: true

  enum payment_method: {
    cash: 0,
    card: 1
  }
end
