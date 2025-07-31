class WorkerResource < ApplicationResource
    attribute :username, :string
    attribute :role, :string_enum, allow: ['user', 'admin']
    attribute :status, :string_enum, allow: ['inactive', 'active']

    has_many :performed_services
end
