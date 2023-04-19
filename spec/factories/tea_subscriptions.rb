FactoryBot.define do
  factory :tea_subscription do
    association :subscription, :tea
  end
end