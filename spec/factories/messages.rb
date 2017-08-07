# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  body          :text(65535)
#  chat_group_id :integer
#  user_id       :integer
#  image         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :message do
    body             { Faker::Pokemon.name } #just for fun
    image            { Faker::Avatar.image }
    chat_group_id    1
    user_id          1
  end
end
