# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


User.create(name: 'Tom Bombadill', photo: 'link', bio: 'Old Tom Bombadil is a merry fellow! Bright Blue his jacket is, and his boots are yellow!', posts_counter: 0)
User.create(name: 'Gandalf the Grey', photo: 'link', bio: 'He wore a tall pointed blue hat, a long grey cloak, and a silver scarf. He had a long white beard and bushy eyebrows that stuck out beyond the brim of his hat.', posts_counter: 0)
User.create(name: 'Frodo Baggins', photo: 'link', bio: 'I will take the Ring, though I do not know the way.', posts_counter: 0)

Post.create(title: 'Plants and Herbs, Pt. 1', author_id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)
Post.create(title: 'How to make a good fongus tea', author_id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)
Post.create(title: 'Plants and Herbs, Pt. 2', author_id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)
Post.create(title: 'Beware, you fools!', author_id: 2, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)
Post.create(title: 'Smoke figures and how to practice', author_id: 2, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)
Post.create(title: 'The great adventures of Bilbo Baggins', author_id: 2, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit vitae beatae, quibusdam odit blanditiis illo quaerat. In optio minima quasi deleniti facere eligendi vel, excepturi fugit nobis rem quaerat non, neque quia veniam, aspernatur ipsum accusantium cumque odit facilis tenetur?', comments_counter: 0, likes_counter: 0)

Comment.create(text: 'My favorite', author_id: 2, post_id: 2)
Comment.create(text: "Come on, don't start with that", author_id: 3, post_id: 4)
Comment.create(text: "Haha! Classic from you my friend", author_id: 1, post_id: 4)

Like.create(author_id: 1, post_id: 1)
Like.create(author_id: 1, post_id: 2)
Like.create(author_id: 1, post_id: 3)
Like.create(author_id: 2, post_id: 2)
Like.create(author_id: 3, post_id: 2)
Like.create(author_id: 3, post_id: 1)
Like.create(author_id: 3, post_id: 5)