# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
u1 = User.create!({email: "henderson@user.user", first_name: "Jonathan", last_name: "Henderson", password: "12345678", password_confirmation: "12345678"})
u2 = User.create!({email: "milner@user.user", first_name: "James", last_name: "Milner", password: "12345678", password_confirmation: "12345678"})

admin = User.new({email: "admin@user.user", first_name: "Jurgen", last_name: "Klopp", password: "12345678", password_confirmation: "12345678"})
admin.add_role(:admin)
admin.save!

# Tasks
Task.create!({name: "Task 1"})

t2 = Task.new({name: "Task 2"})
t2.start
t2.user = u1
t2.save!

t3 = Task.new({name: "Task 3"})
t3.finish
t3.user = u2
t3.save!
