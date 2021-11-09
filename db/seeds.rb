require 'faker'

(1..20).each do |id|
  User.create!(
      id: id, 
      name: Faker::Name.name,
      photo: Faker::Lorem.sentence,
      bio: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true),
      post_counter: 0,
  )
end

(1..100).each do |id|
  Post.create!(
      id: id,
      author_id: rand(1..20),
      title: Faker::Book.title,
      text: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true),
      comments_counter: 0,
      likes_counter: 0,
  )
end

(1..100).each do |id|
  Comment.create!(
      id: id,
      post_id: rand(1..10),
      author_id: rand(1..20),
      text: Faker::Lorem.paragraph,
  )
end

(1..100).each do |id|
  Like.create!(
      id: id,
      author_id: rand(1..20),
      post_id: rand(1..10),
  )
end

User.all.each do |u|
  u.post_counter = u.posts.count
  u.save
end

Post.all.each do |p|
  p.comments_counter = p.comments.count
  p.likes_counter = p.likes.count
  p.save
end