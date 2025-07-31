class ServiceMaterialLogResource < ApplicationResource
    attribute :service_material_id, :integer_id
    attribute :date, :datetime

    belongs_to :service_material
end
