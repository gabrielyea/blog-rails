FactoryBot.define do
  factory :post do
    title { Faker::Fantasy::Tolkien.race }
    text { Faker::Fantasy::Tolkien.poem }
    comments_counter { Faker::Number.within(range: 1..10) }
    likes_counter { Faker::Number.within(range: 1..10) }
    author_id { Faker::Number.within(range: 1..10) }
  end
end
