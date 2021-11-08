# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# (1..20).each do |id|
#   User.create!(
#       id: id, 
#       name: Faker::Name.name,
#       photo: Faker::Lorem.sentence,
#       bio: Faker::Lorem.sentence(word_count: 3, supplemental: true),
#       post_counter: 0,
#   )
# end

(1..10).each do |id|
  Post.create(
      id: id,
      author_id: rand(1..20),
      title: Faker::Book.title,
      text: Faker::Lorem.paragraph,
      comments_counter: 0,
      likes_counter: 0,
  )
end

(1..10).each do |id|
  Comment.create!(
      id: id,
      post_id: rand(1..10),
      author_id: rand(1..20),
      text: Faker::Lorem.paragraph,
  )
end

(1..10).each do |id|
  Like.create!(
      id: id,
      author_id: rand(1..20),
      post_id: rand(1..10),
  )
end
# User.create(name: 'Tom Bombadill', photo: 'link', bio: 'Old Tom Bombadil is a merry fellow! Bright Blue his jacket is, and his boots are yellow!', posts_counter: 0)

# Post.create(title: 'Plants and Herbs, Pt. 1', author_id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)

# Comment.create(text: 'My favorite', author_id: 2, post_id: 2)

# Like.create(author_id: 1, post_id: 1)
