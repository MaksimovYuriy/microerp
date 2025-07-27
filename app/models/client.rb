class Client < ApplicationRecord
    has_many :notes

    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true

end
