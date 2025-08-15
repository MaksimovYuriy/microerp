class Client < ApplicationRecord
    has_many :notes
    has_many :performed_services
    has_many :canceled_services

    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true

end
