# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  encrypted_password     :string(255)
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

require 'rails_helper'

RSpec.describe User do
  describe '#Create Action' do
    context 'About Properties' do
      let(:user) { build(:user) }

      it 'is valid with name, email, password, password_confirmation' do
        expect(user).to be_valid
      end

      it 'is invalid without name' do
        user.name = ""
        user.valid?
        expect(user.errors[:name]).to include('can\'t be blank')
      end

      it 'is invalid without password' do
        user.password = ""
        user.valid?
        expect(user.errors[:password]).to include('can\'t be blank')
      end

      it 'is invalid without email' do
        user.email = ""
        user.valid?
        expect(user.errors[:email]).to include('can\'t be blank')
      end

      it 'is valid when a range in characters for password is from 8 to 128 characters' do
        password                   = Faker::Internet.password(6, 128)
        user.password              = password
        user.password_confirmation = password
        expect(user).to be_valid
      end

      it 'is invalid when characters for password are less than 6' do
        password                   = Faker::Internet.password(1, 5)
        user.password              = password
        user.password_confirmation = password
        user.valid?
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'is invalid when characters for password are more than 128' do
        password                   = Faker::Internet.password(129)
        user.password              = password
        user.password_confirmation = password
        user.valid?
        expect(user.errors[:password]).to include('is too long (maximum is 128 characters)')
      end

      it 'is invalid if password and password_confirmation do not match' do
        unauthentic_password = Faker::Internet.password
        expect(user.password).not_to be(unauthentic_password)
      end

      it 'is invalid when an email is already token' do
        fake_email = Faker::Internet.email
        existing_user = create(:user, email: fake_email)
        following_user = build(:user, email: fake_email)
        following_user.valid?
        expect(following_user.errors[:email]).to include('has already been taken')
      end
    end
  end
end
