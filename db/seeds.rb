Customer.create!(first_name: "Chandler", last_name: "Jones", email: "chandlerj@email.com")
Customer.create!(first_name: "Jerry", last_name: "Rice", email: "jerryr@email.com")

(1..10).each do |id|
    Tea.create!(
        id: id,
        title: Faker::Tea.variety,
        description: Faker::Coffee.notes,
        brew_time: Faker::Number.number(digits: 2)
    )
end