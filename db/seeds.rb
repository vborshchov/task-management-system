# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

User.create!([
  {id: 1, last_name:"Borshchov", first_name:"Victor", email:"borshchov@rambler.ru", password: "password"},
  {id: 2, last_name:"Pupkin", first_name:"Alex", email:"apupkin@ukr.net", password: "password"}
])

Task.delete_all

Task.create!([
  {id: 1, title: "Play chess", description: "I like play chess", priority: 1, user_id: 1, due_date: "2015-09-10"},
  {id: 2, title: "Play football", description: "I like play football", priority: 2, user_id: 1, due_date: "2015-10-25", active: false},
  {id: 3, title: "Play poker", description: "I like play poker", priority: 3, user_id: 1, due_date: "2015-10-25"},
  {id: 4, title: "Play basketball", description: "I like play basketball", priority: 4, user_id: 1, due_date: "2015-08-29", active: false},
  {id: 5, title: "Play baseball", description: "I like play baseball", priority: 5, user_id: 1, due_date: "2016-01-01"},
  {id: 6, title: "Read books", description: "I like read books", priority: 1, user_id: 1, due_date: "2015-10-10", active: false},
  {id: 7, title: "Read magazines", description: "I like read magazines", priority: 2, user_id: 1, due_date: "2015-08-19"},
  {id: 8, title: "Read newspapers", description: "I like read newspapers", priority: 3, user_id: 1, due_date: "2015-10-12", active: false},
  {id: 9, title: "Read tables", description: "I like read tables", priority: 4, user_id: 1, due_date: "2015-11-03"},
  {id: 10, title: "Read signs", description: "I like read signs", priority: 3, user_id: 1, due_date: "2015-12-13"},
  {id: 11, title: "Watch films", description: "I like watch films", priority: 2, user_id: 1, due_date: "2015-10-13", active: false},
  {id: 12, title: "Write a poem", description: "I like write poems", priority: 6, user_id: 1, due_date: "2016-01-23"},
  {id: 13, title: "Eat ice-cream", description: "I like ice-cream", priority: 1, user_id: 1, due_date: "2015-12-01", active: false},
  {id: 14, title: "Make a party", description: "I like read parties", priority: 5, user_id: 1, due_date: "2015-12-31"},
  {id: 15, title: "Tell a story to my neighbour", description: "I like tell stories", priority: 100, user_id: 1, due_date: "2016-01-31"}
])