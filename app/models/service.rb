class Service < ApplicationRecord
    has_many :notes
    has_many :performed_services
    has_many :service_materials

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :status, presence: true

    enum status: {
        inactive: 0,
        active: 1
    }
end
