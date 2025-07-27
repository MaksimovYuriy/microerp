class Worker < ApplicationRecord
    has_many :performed_services

    validates :username, presence: true, uniqueness: true
    validates :encrypted_password, presence: true
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
