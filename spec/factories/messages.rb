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

FactoryGirl.define do
  factory :message do
    body        { Faker::Pokemon.name } #just for fun
    image       Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/support/image/ph04.png'))
    association :chat_group, factory: :chat_group, name: Faker::Pokemon.name
    association :user,       factory: :user,       name: Faker::Pokemon.name
  end
end
