FactoryBot.define do
  factory :inquiry do
    user { FactoryBot.create(:user) }
    inquiry { Faker::Lorem.sentence }
  end
end
