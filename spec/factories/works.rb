FactoryBot.define do
  factory :work do
    main_title            {Faker::Name.name}
    explanation           {Faker::Lorem.characters(number: 50)}
    category_id           {Faker::Number.between(from: 2, to: 7)}

    user { FactoryBot.create(:user) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
