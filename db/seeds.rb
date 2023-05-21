# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do |n|
    work = Work.create!(
        main_title: "#{n}",
        explanation: "#{n}",
        category_id: n % 6 + 2,
        user_id: 1
    )

    work.image.attach(io: File.open(Rails.root.join('app','assets','images','syaro.png')), filename: 'syaro.png')
end