class CanceledService < ApplicationRecord
  belongs_to :client
  belongs_to :service
  belongs_to :worker

  validates :client, presence: true
  validates :service, presence: true
  validates :worker, presence: true
  validates :date, presence: true
end
