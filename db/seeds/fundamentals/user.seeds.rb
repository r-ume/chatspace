# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require_relative '../seed_base.rb'

1.upto(SeedBase::DUMMY_REPEAT_NUM) do |num|
  begin
    @seed = SeedBase.new(
      model_name: 'User',
      name:       Faker::HowIMetYourMother.character,
      email:      Faker::Internet.email(Faker::HowIMetYourMother.character) ,
      password:   Faker::Internet.password(10, 20)
    )
    @seed.save!
    @seed.output_columns
  rescue => error
    @seed.output_error(error: error)
  end
end
