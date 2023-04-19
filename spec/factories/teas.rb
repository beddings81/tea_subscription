FactoryBot.define do
  factory :tea do
    title {Faker::Tea.variety}
    description {Faker::Coffee.notes }
    brew_time {Faker::Number.number(digits: 2)}
  end
end