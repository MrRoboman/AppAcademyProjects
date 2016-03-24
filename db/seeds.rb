# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
10.times do
   users << User.create!({name: Faker::Name.name})
 end

polls = []
3.times do |i|
  poll = Poll.create!(title: Faker::App.name, author_id: i+1)
  Question.create!(text: "How many stars do you give this app?", poll_id: poll.id)
  Question.create!(text: "How many hours a day do you use this app?", poll_id: poll.id)
end


4.times do |i|
  AnswerChoice.create!(text: "#{i+1} stars", question_id: 1)
end

4.times do |i|
  AnswerChoice.create!(text: "#{i+1} hours", question_id: 2)
end

(4..10).each do |i|
  Response.create!(user_id: i, answer_choice_id: rand(1..4))
  Response.create!(user_id: i, answer_choice_id: rand(5..8))
end
