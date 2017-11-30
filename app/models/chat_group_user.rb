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

class ChatGroupUser < ApplicationRecord

  # Association
  belongs_to :chat_group
  belongs_to :user

  # Validation
  validates :chat_group_id, :user_id, presence: true, numericality: { only_integer: true }

end
