# == Schema Information
#
# Table name: chat_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChatGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :messages, :users

  def messages
    object.messages
  end

  def users
    object.users
  end

end
