FactoryGirl.define do
  factory :message do
    body             { Faker::Pokemon.name } #just for fun
    image            { Faker::Avatar.image }
    chat_group_id    1
    user_id          1
  end
end
