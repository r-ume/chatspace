# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  body          :text(65535)
#  chat_group_id :integer
#  user_id       :integer
#  image         :string(255)
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

  #　この書き方、重要
  def json_api
    {
        user: user.name,
        body: body,
        time: created_at.strftime('%Y/%m/%d %H:%M:%S'),
        image: image.to_s
    }
  end

  private
  def body_or_image
    body.presence or image.presence
  end
end
