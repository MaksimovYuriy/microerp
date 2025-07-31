class ClientResource < ApplicationResource
  attribute :name, :string
  attribute :phone, :string
  attribute :telegram, :string
  attribute :bonuses, :integer
  attribute :description, :string
  attribute :birth_date, :datetime

  has_many :notes
  has_many :performed_services
end
