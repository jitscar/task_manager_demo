require 'faker'

FactoryGirl.define do
  factory :user do
    email { "user@user.user" }
    password { Faker::Internet.password(8) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end