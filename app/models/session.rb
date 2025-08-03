class Session < ApplicationRecord
    validates :token, presence: true
    validates :message, presence: true
end
