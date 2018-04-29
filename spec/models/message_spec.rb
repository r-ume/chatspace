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

require 'rails_helper'

include ActionDispatch::TestProcess

RSpec.describe Message do
  describe '#Create' do
    let(:message) { build(:message) }

    context 'When a message can be saved' do
      it 'is valid with all attributes(body, image, user_id, group_id) contained' do
        expect(message).to be_valid
      end

      it 'is valid with a message' do
        message.body = Faker::Pokemon.name # just for fun
        expect(message).to be_valid
      end

      it 'is valid with an image included' do
        message.body = ""
        message.image = fixture_file_upload('ph04.png')
        expect(message).to be_valid
      end

      it 'is valid with both a message and an image included' do
        message.image = fixture_file_upload('ph04.png')
        message.body = Faker::Pokemon.name # just for fun
        expect(message).to be_valid
      end
    end

    context 'When a message cannot be saved' do
      it 'is invalid without both a body message and an image' do
        message.body = nil
        message.image = nil
        save_result = message.valid?
        expect(save_result).to be false
      end

      it 'is invalid without a group_id' do
        message.chat_group_id = nil
        save_result = message.invalid?
        expect(save_result).to be true
      end

      it 'is invalid without a user_id' do
        message.user_id = nil
        save_result = message.invalid?
        expect(save_result).to be true
      end
    end
  end
end
