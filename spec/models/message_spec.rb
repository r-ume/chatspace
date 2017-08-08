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

require 'rails_helper'

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
        message.image = Faker::Company.logo
        expect(message).to be_valid
      end

      it 'is valid with both a message and an image included' do
        message.image = Faker::Company.logo
        message.body = Faker::Pokemon.name # just for fun
        expect(message).to be_valid
      end
    end

    context 'When a message cannot be saved' do
      it 'is invalid without a body message' do
        message.body = ""
        message.valid?
        expect(message.errors[:body]).to include("can't be blank")
      end
    end
  end
end
