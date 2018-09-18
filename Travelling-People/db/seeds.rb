# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
                username:              "administrator",
                email:                 "admin@gmail.com",
                password:              "password",
                password_confirmation: "password",
                admin:                 true
              },
              {
                username:              "Bob",
                email:                 "bob@mail.com",
                password:              "password",
                password_confirmation: "password",
                admin:                 false
              },
              {
                username:              "Alice",
                email:                 "alice@mail.com",
                password:              "password",
                password_confirmation: "password",
                admin:                 false
              }])

Report.create!(
  title:   "Lorem ipsum",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  user_id: User.find_by(name: "Bob").id
  )

ReportLike.create!(
  user_id:   User.find_by(name: "Alice").id
  report_id: Report.first.id,
  )

ReportComment.create!(
  user_id:   User.find_by(name: "Alice").id
  report_id: Report.first.id,
  content:   "My first comment!"
  )