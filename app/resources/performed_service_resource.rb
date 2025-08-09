class PerformedServiceResource < ApplicationResource
    attribute :client_id, :integer_id
    attribute :service_id, :integer_id
    attribute :worker_id, :integer_id
    attribute :bonuses, :boolean
    attribute :total_price, :integer
    attribute :payment_method, :string_enum, allow: PerformedService.payment_methods.keys
    attribute :date, :datetime

    belongs_to :client
    belongs_to :service
    belongs_to :worker
end
