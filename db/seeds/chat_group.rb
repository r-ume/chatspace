# == Schema Information
#
# Table name: chat_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

chat_groups = []
DUMMY_CREATE_NUM = 5

1.upto(DUMMY_CREATE_NUM) do |num|
  chat_group = ChatGroup.new(name: Faker::Pokemon.name)
  chat_group.save
  chat_groups << chat_group
end
