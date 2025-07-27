class Client < ApplicationRecord

    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true

end
