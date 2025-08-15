class CanceledServiceResource < ApplicationResource
    attribute :client_id, :integer_id
    attribute :service_id, :integer_id
    attribute :worker_id, :integer_id
    attribute :date, :datetime

    belongs_to :client
    belongs_to :service
    belongs_to :worker
end
