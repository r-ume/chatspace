# == Schema Information
#
# Table name: chat_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# require '../seed_base.rb'

after 'fundamentals:user' do
  1.upto(SeedBase::DUMMY_REPEAT_NUM) do |num|
    begin
      @seed = SeedBase.new(
        model_name: 'ChatGroup',
        name:       Faker::HowIMetYourMother.character
      )
      @seed.save!
      @seed.output_columns
    rescue => error
      @seed.output_error(error: error)
    end
  end
end
