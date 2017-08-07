# == Schema Information
#
# Table name: chat_group_users
#
#  id            :integer          not null, primary key
#  chat_group_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ChatGroupUser < ActiveRecord::Base
  belongs_to :chat_group
  belongs_to :user
end
