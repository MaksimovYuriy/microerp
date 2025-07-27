FactoryBot.define do
  factory :performed_service do
    client { nil }
    service { nil }
    worker { nil }
    bonuses { false }
    total_price { 1 }
    payment_method { 1 }
    date { "2025-07-27 13:26:46" }
  end
end
