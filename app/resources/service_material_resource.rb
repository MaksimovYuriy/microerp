class ServiceMaterialResource < ApplicationResource
    attribute :service_id, :integer_id
    attribute :material_id, :integer_id
    attribute :required_quantity, :float

    belongs_to :service
    belongs_to :material

    has_many :service_material_logs
end
