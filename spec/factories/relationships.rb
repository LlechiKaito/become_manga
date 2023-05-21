FactoryBot.define do
  factory :relationship do
    follower { FactoryBot.create(:user) }
    followed { FactoryBot.create(:user) }
  end
end
