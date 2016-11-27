class Message < ActiveRecord::Base
  belongs_to :chat_group
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1 }

  mount_uploader :image, ImageUploader

  #　この書き方、重要
  def json_api
    {
        user_name: user.name,
        body: body,
        created_at: created_at.strftime('%Y/%m/%d %H:%M:%S'),
        image_url: image.to_s
    }
  end
end