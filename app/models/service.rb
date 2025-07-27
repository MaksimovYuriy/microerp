class Service < ApplicationRecord
    has_many :notes

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :status, presence: true

    enum status: {
        inactive: 0,
        active: 1
    }

end
