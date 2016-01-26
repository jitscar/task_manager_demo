require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@user.user"}
    password "12345678"
    password_confirmation "12345678"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
  end
end