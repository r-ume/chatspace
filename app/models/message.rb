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
  belongs_to :user
  belongs_to :chat_group

  validates :body, :image, presence: true
  validates_associated :user
  validates_associated :chat_group

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
end
