class NoteResource < ApplicationResource
    attribute :client_id, :integer_id
    attribute :service_id, :integer_id
    attribute :date, :datetime
    attribute :state, :string_enum, allow: Note.aasm.states.map(&:name).map(&:to_s)

    belongs_to :client
    belongs_to :service
end
