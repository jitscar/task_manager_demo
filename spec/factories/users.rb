require 'faker'

FactoryGirl.define do
  factory :user do
    email { "user@user.user" }
    password { Faker::Internet.password(8) }
  end
end