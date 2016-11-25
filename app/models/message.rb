class Message < ActiveRecord::Base
  belongs_to :chat_group
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1 }

  mount_uploader :image, ImageUploader
end