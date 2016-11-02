class User < ActiveRecord::Base
  has_many: :chat_group_users
  has_many: :chat_groups, through: :chat_group_users
  has_many: :messages
end
