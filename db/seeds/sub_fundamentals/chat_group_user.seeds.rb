# == Schema Information
#
# Table name: chat_group_users
#
#  id            :integer          not null, primary key
#  chat_group_id :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

DUMMY_REPEAT_NUMS = 30

1.upto(DUMMY_REPEAT_NUMS) do |num|

  chat_group_user = ChatGroupUser.new(
    chat_group_id: ChatGroup.pluck(:id).sample,
    user_id:       User.pluck(:id).sample,
  )

  chat_group_user.save
end
