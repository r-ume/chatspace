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

after 'fundamentals:chat_group' do
  1.upto(SeedBase::DUMMY_REPEAT_NUM) do |num|
    begin
      @seed = SeedBase.new(
        model_name:    'Message',
        body:          Faker::HowIMetYourMother.quote,
        chat_group_id: ChatGroup.pluck(:id).sample,
        user_id:       User.pluck(:id).sample,
        image:         Faker::Avatar.image
      )
      @seed.save!
      @seed.output_columns
    rescue => error
      @seed.output_error(error: error)
    end
  end
end
