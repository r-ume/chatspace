# == Schema Information
#
# Table name: chat_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChatGroup < ActiveRecord::Base
  has_many :chat_group_users
  has_many :users, through: :chat_group_users
  has_many :messages
end
