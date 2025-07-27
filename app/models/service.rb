class Service < ApplicationRecord
    has_many :notes
    has_many :performed_services

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :status, presence: true

    enum status: {
        inactive: 0,
        active: 1
    }

end
