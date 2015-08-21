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


# Acceptance Criteria:
Task.create!([
  {title: "sign up", description: "User should be able to sign up", priority: 1, user_id: 1, due_date: "2015-08-23"},
  {title: "sign in", description: "User should be able to sign in", priority: 4, user_id: 1, due_date: "2015-08-23"},
  {title: "sign out", description: "User should be able to sign in", priority: 7, user_id: 1, due_date: "2015-08-23"},
  {title: "first name", description: "User has first name", priority: 10, user_id: 1, due_date: "2015-08-23"},
  {title: "last name", description: "User has last name", priority: 13, user_id: 1, due_date: "2015-08-23"},
  {title: "email", description: "User has email", priority: 16, user_id: 1, due_date: "2015-08-23"},
  {title: "activation email", description: "User receives email with activation link after sign up", priority: 19, user_id: 1, due_date: "2015-08-23"},
  {title: "view all tasks", description: "User should be able to view all tasks (the list of all tasks that belong to user, display only title)", priority: 22, user_id: 1, due_date: "2015-08-23"},
  {title: "mousing hover task", description: "User should be able to by mousing hover a particular task the 'edit' and 'delete' links should appear next to the title", priority: 25, user_id: 1, due_date: "2015-08-23"},
  {title: "crate task", description: "User should be able to create new task", priority: 28, user_id: 1, due_date: "2015-08-23"},
  {title: "edit task", description: "User should be able to edit existing task", priority: 31, user_id: 1, due_date: "2015-08-23"},
  {title: "delete task", description: "User should be able to delete existing task", priority: 34, user_id: 1, due_date: "2015-08-23"},
  {title: "mark task as completed or active", description: "Mark task as completed and make it active again if task is completed", priority: 37, user_id: 1, due_date: "2015-08-23"},
  {title: "User can manage only his own tasks", description: "", priority: 40, user_id: 1, due_date: "2015-08-23"},
  {title: "task has title", description: "", priority: 43, user_id: 1, due_date: "2015-08-23"},
  {title: "task has description", description: "", priority: 46, user_id: 1, due_date: "2015-08-23"},
  {title: "task has priority", description: "", priority: 49, user_id: 1, due_date: "2015-08-23"},
  {title: "task has due date", description: "", priority: 52, user_id: 1, due_date: "2015-08-23"},
  {title: "two lists of tasks", description: "Basicaly there should be two lists, one is active tasks, another one is completed. By marking task as completed a particular task moves to appropriate list." , priority: 55, user_id: 1, due_date: "2015-08-23"},
  {title: "show task", description: "Every title of the task on the home page is a link, by clicking the link user is taken to this page here display all the attributes of the task", priority: 58, user_id: 1, due_date: "2015-08-23"},
  {title: "edit page", description: "By clicking 'edit' link on the Home page user is taken to this page. This page displays a form with task's data. User should be able to edit any attribute", priority: 61, user_id: 1, due_date: "2015-08-23"},
  {title: "validation title", description: "Title can\'t be blank", priority: 64, user_id: 1, due_date: "2015-08-23"},
  {title: "validation priority", description: "Priority should be a number", priority: 67, user_id: 1, due_date: "2015-08-23"},
  {title: "validation due date", description: "Due date should be a future date", priority: 70, user_id: 1, due_date: "2015-08-23"},
  {title: "client side validation", description: "Nice to have if there are client side validation as well", priority: 73, user_id: 1, due_date: "2015-08-23"},
  {title: "datepicker", description: "Use datepicker for date input", priority: 76, user_id: 1, due_date: "2015-08-23"},
  {title: "batch delete", description: "User should be able to make a batch delete on the Home page. Checkboxes next to each task, user checks some tasks and clicks button 'batch delete' which deletes selected tasks", priority: 79, user_id: 1, due_date: "2015-08-23"},
  {title: "check uncheck all buttons", description: "There should be two links/buttons: 'check all' and 'uncheck all'", priority: 82, user_id: 1, due_date: "2015-08-23"},
  {title: "sort by title", description: "User should be able to sort the list on the Home page by title", priority: 85, user_id: 1, due_date: "2015-08-23"},
  {title: "bootstrap", description: "User twitter bootstrap for nice UI", priority: 88, user_id: 1, due_date: "2015-08-23"},
  {title: "Rspec tests", description: "Few tests with Rspec (e.g. add a method `full name` to user model and add tests for it, add tests for validation rules)", priority: 91, user_id: 1, due_date: "2015-08-23"},
  {title: "AJAX", description: "Try to use Ajax wherever it is possible (e.g. delete task on the home page), minimum page reloads", priority: 94, user_id: 1, due_date: "2015-08-23"},
  {title: "github", description: "Use github to host the code", priority: 97, user_id: 1, due_date: "2015-08-23"},
  {title: "heroku", description: "Use heroku to deploy the app", priority: 100, user_id: 1, due_date: "2015-08-23"}
])

# Tasks for second user
Task.create!([
  {title: "Play chess", description: "I like play chess", priority: 1, user_id: 1, due_date: "2015-09-10"},
  {title: "Play football", description: "I like play football", priority: 2, user_id: 1, due_date: "2015-10-25", active: false},
  {title: "Play poker", description: "I like play poker", priority: 3, user_id: 1, due_date: "2015-10-25"},
  {title: "Play basketball", description: "I like play basketball", priority: 4, user_id: 1, due_date: "2015-08-29", active: false},
  {title: "Play baseball", description: "I like play baseball", priority: 5, user_id: 1, due_date: "2016-01-01"},
  {title: "Read books", description: "I like read books", priority: 1, user_id: 1, due_date: "2015-10-10", active: false},
  {title: "Read magazines", description: "I like read magazines", priority: 2, user_id: 1, due_date: "2015-08-19"},
  {title: "Read newspapers", description: "I like read newspapers", priority: 3, user_id: 1, due_date: "2015-10-12", active: false},
  {title: "Read tables", description: "I like read tables", priority: 4, user_id: 1, due_date: "2015-11-03"},
  {title: "Read signs", description: "I like read signs", priority: 3, user_id: 1, due_date: "2015-12-13"},
  {title: "Watch films", description: "I like watch films", priority: 2, user_id: 1, due_date: "2015-10-13", active: false},
  {title: "Write a poem", description: "I like write poems", priority: 6, user_id: 1, due_date: "2016-01-23"},
  {title: "Eat ice-cream", description: "I like ice-cream", priority: 1, user_id: 1, due_date: "2015-12-01", active: false},
  {title: "Make a party", description: "I like read parties", priority: 5, user_id: 1, due_date: "2015-12-31"},
  {title: "Tell a story to my neighbour", description: "I like tell stories", priority: 100, user_id: 1, due_date: "2016-01-31"}
])