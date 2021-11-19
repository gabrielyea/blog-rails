FactoryBot.define do
  factory :user do
    name { Faker::Movies::StarWars.character }
    email { Faker::Internet.email }
    bio { Faker::Games::DnD.alignment }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
