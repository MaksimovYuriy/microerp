FactoryBot.define do
  factory :canceled_service do
    client { nil }
    service { nil }
    worker { nil }
  end
end
