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
    context 'Properties' do
      let(:message) { FactoryGirl.build(:message) }

      it 'is valid with all attributes(body, image, user_id, group_id)' do
        expect(message).to be_valid
      end

      it 'is invalid without a body message' do
        message.body = ""
        message.valid?
        expect(message.errors[:body]).to include("can't be blank")
      end
    end
  end
end
