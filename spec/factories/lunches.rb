FactoryBot.define do
  factory :lunch do
    occasion { Faker::Lorem.sentence(3) }
    date { Faker::Date.between(from: 2.years.ago, to: Date.current) }
    user
    vendor
  end
end
