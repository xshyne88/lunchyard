FactoryBot.define do
  factory :user do
    first_name { Faker::Lorem.sentence(3) }
    birthdate { Faker::Date.between(from: 2.months.ago, to: Date.current) }
  end
end
