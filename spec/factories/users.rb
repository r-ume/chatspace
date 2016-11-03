FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'testtest'
    encrypted_password 'test'
    name 'tester'
  end
end