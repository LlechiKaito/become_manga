FactoryBot.define do
  factory :read_count do
    user { FactoryBot.create(:user) }
    comic { FactoryBot.create(:comic) }
  end
end
