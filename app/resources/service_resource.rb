class ServiceResource < ApplicationResource
    attribute :name, :string
    attribute :price, :integer
    attribute :status, :string_enum, allow: Service.statuses.keys

    has_many :notes
    has_many :performed_services
    has_many :service_materials
end
