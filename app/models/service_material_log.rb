class ServiceMaterialLog < ApplicationRecord
  belongs_to :service_material

  validates :service_material, presence: true
  validates :date, presence: true
end
