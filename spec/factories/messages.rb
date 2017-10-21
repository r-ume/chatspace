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

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :message do
    body        { Faker::Pokemon.name } #just for fun
    image       { fixture_file_upload(Rails.root.join('spec/fixtures/ph04.png')) }
    association :chat_group, factory: :chat_group, name: Faker::Pokemon.name
    association :user,       factory: :user,       name: Faker::Pokemon.name
  end
end
