class Material < ApplicationRecord
    has_many :service_materials

    validates :name, presence: true, uniqueness: true
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :alert_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
