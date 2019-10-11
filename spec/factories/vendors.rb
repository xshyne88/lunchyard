FactoryBot.define do
  factory :vendor do
    name { Faker::Lorem.sentence(3) }
    last_catered { Faker::Date.between(from: 10.weeks.ago, to: Date.current) }
  end
end
