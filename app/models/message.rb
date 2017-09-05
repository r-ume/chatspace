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

class Message < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :chat_group

  # validations
  validates :body_or_image, presence: true
  validates :user,          presence: true
  validates :chat_group,    presence: true

  mount_uploader :image, ImageUploader

  private
  def body_or_image
    body.presence or image.presence
  end
end
