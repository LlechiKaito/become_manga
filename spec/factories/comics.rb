FactoryBot.define do
  factory :comic do
    subtitle { Faker::Lorem.sentence }
    work { FactoryBot.create(:work) }
    explanation { Faker::Lorem.sentence }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
      item.images.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
