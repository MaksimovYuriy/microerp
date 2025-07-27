class ServiceMaterial < ApplicationRecord
  belongs_to :service
  belongs_to :material
  has_many :service_material_logs

  validates :service, presence: true
  validates :material, presence: true
  validates :required_quantity, presence: true, numericality: { greater_than: 0 }
end
