# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  body          :text(65535)      not null
#  image         :string(255)      default(""), not null
#  chat_group_id :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Message < ApplicationRecord

  # Association
  belongs_to :user
  belongs_to :chat_group

  # Validation
  validates :body_or_image, :user_id, :chat_group_id, presence: true
  validates :chat_group_id, :user_id,                 numericality: { only_integer: true }

  # Uploader
  mount_uploader :image, ImageUploader

  private
  def body_or_image
    body.presence or image.presence
  end
end
