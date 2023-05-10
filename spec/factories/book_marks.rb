FactoryBot.define do
  factory :book_mark do
    work { FactoryBot.create(:work)}
    user { work.user }
  end
end
