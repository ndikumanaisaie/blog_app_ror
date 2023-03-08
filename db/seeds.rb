# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Like.destroy_all
# Comment.destroy_all
# Post.destroy_all
# User.destroy_all

user1 = User.create(name: 'Eliane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Telecom Engineer at ARCT.')
user2 = User.create(name: 'Charles', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user3 = User.create(name: 'Simon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Burundi.')
user4 = User.create(name: 'Vianney', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Engineer.')


post1 = Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')
post2 = Post.create(author_id: 1, title: 'Morning', text: 'This is my second post')
post3 = Post.create(author_id: 2, title: 'God bless you', text: 'This is my Third post')
post4 = Post.create(author_id: 2, title: 'Good night', text: 'This is my fourth post')

Comment.create(post_id: 1, author_id: 1, text: 'wonderful day!' )
Comment.create(post_id: 1, author_id: 1, text: 'You are amazing!')
Comment.create(post_id: 2, author_id: 1, text: 'Nice sunday!')
Comment.create(post_id: 3, author_id: 2, text: 'Microverse is super awosome')
Comment.create(post_id: 4, author_id: 2, text: 'it is sunny')
Comment.create(post_id: 1, author_id: 1, text: 'rails is magic')