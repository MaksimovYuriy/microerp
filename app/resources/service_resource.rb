class ServiceResource < ApplicationResource
    attribute :name, :string
    attribute :price, :integer
    attribute :status, :string_enum, allow: Service.statuses.keys

    has_many :notes
end
