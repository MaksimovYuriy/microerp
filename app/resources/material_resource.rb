class MaterialResource < ApplicationResource
    attribute :name, :string
    attribute :quantity, :float
    attribute :alert_quantity, :float

    has_many :service_materials
end
