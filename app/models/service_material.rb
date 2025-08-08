class ServiceMaterial < ApplicationRecord
  belongs_to :service
  belongs_to :material
  has_many :service_material_logs

  validates :service, presence: true
  validates :material, presence: true
  validates :required_quantity, presence: true, numericality: { greater_than: 0 }

  validate :service_and_material_are_different

  private

  def service_and_material_are_different
    existing = ServiceMaterial.where(service_id: service_id, material_id: material_id)
    existing = existing.where.not(id: id) if persisted?

    if existing.exists?
      errors.add(:base, 'Already exists! Change required_quantity!')
    end
  end
end
