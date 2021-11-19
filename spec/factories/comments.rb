FactoryBot.define do
  factory :comment do
    text { Faker::Fantasy::Tolkien.poem }
    author_id { Faker::Number.within(range: 1..10) }
    post_id { nil }
  end
end
