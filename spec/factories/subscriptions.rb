FactoryBot.define do
  factory :subscription do
    title
    price {Faker::Name::last_name}
    status { 0 }
    frequency {Faker::Number.within(range: 0..1)}
  end
end