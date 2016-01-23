FactoryGirl.define do
  factory :task do
    name { "Task 1" }
    description { Faker::Lorem.sentence  }
  end
end
