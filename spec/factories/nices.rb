FactoryBot.define do
  factory :nice do
    user { FactoryBot.create(:user) }
    comic { FactoryBot.create(:comic) }
  end
end
