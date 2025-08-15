class Worker < ApplicationRecord
    has_secure_password

    has_many :performed_services
    has_many :canceled_services

    validates :username, presence: true, uniqueness: true
    validates :role, presence: true
    validates :status, presence: true

    enum role: {
        user: 0,
        admin: 1
    }

    enum status: {
        inactive: 0,
        active: 1
    }

end
