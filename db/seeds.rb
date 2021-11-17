# require 'faker'

# (1..20).each do |id|
#   User.create!(
#       id: id, 
#       name: Faker::Name.name,
#       photo: Faker::Lorem.sentence,
#       bio: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
#       post_counter: 0,
#   )
# end

# (1..100).each do |id|
#   Post.create!(
#       id: id,
#       author_id: rand(1..20),
#       title: Faker::Book.title,
#       text: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true),
#       comments_counter: 0,
#       likes_counter: 0,
#   )
# end

# (1..100).each do |id|
#   Comment.create!(
#       id: id,
#       post_id: rand(1..100),
#       author_id: rand(1..20),
#       text: Faker::Lorem.paragraph,
#   )
# end

# (1..100).each do |id|
#   Like.create!(
#       id: id,
#       author_id: rand(1..20),
#       post_id: rand(1..100),
#   )
# end

# User.all.each do |u|
#   u.post_counter = u.posts.count
#   u.save
# end

# Post.all.each do |p|
#   p.comments_counter = p.comments.count
#   p.likes_counter = p.likes.count
#   p.save
# end

# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end

user = User.new(
  email: 'oli@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'Oliver',
  role: 'admin'
)
user.skip_confirmation!
user.save!

user = User.new(
  email: 'arthur@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'Arthur',
  role: 'default'
)
user.skip_confirmation!
user.save!

user = User.new(
  email: 'gabriel@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'Gabriel',
  role: 'default'
)
user.skip_confirmation!
user.save!

(1..10).each do |id|
  Post.create!(
      id: id,
      author_id: rand(1..3),
      title: Faker::Book.title,
      text: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true),
      comments_counter: 0,
      likes_counter: 0,
  )
end

(1..10).each do |id|
  Comment.create!(
      id: id,
      post_id: rand(1..10),
      author_id: rand(1..3),
      text: Faker::Lorem.paragraph,
  )
end