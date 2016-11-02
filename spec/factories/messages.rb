FactoryGirl.define do

  factory :message do
    text "rspec_message"
    chat_group_id 1
    user_id 1
    image "rspec.jpg"
  end
end