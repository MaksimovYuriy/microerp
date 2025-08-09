class WorkerResource < ApplicationResource
    attribute :username, :string
    attribute :role, :string_enum, allow: Worker.roles.keys
    attribute :status, :string_enum, allow: Worker.statuses.keys

    has_many :performed_services
end
