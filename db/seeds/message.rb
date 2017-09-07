# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  body          :text(65535)      not null
#  chat_group_id :integer          default(0), not null
#  user_id       :integer          default(0), not null
#  image         :string(255)      default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

DUMMY_REPEAT_TIMES = 100

DUMMY_REPEAT_TIMES.times do |num|

  message = Message.new(
    body:          Faker::HowIMetYourMother.quote,
    chat_group_id: ChatGroup.pluck(:id).sample,
    user_id:       User.pluck(:id).sample,
    image:         Faker::Avatar.image
  )

  message.save
end
