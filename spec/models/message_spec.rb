require 'rails_helper'

RSpec.describe Message do

  describe '#create' do
    context 'Checking Attributes Existence' do
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
