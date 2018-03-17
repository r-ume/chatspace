# == Schema Information
#
# Table name: chat_group_users
#
#  id            :integer          not null, primary key
#  chat_group_id :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# require '../seed_base.rb'

after 'fundamentals' do
  1.upto(SeedBase::DUMMY_REPEAT_NUM) do |num|
    begin
      @seed = SeedBase.new(
        model_name:    'ChatGroupUser',
        user_id:       User.pluck(:id).sample,
        chat_group_id: ChatGroup.pluck(:id).sample
      )
      @seed.save!
      @seed.output_columns
    rescue => error
      @seed.output_error(error: error)
    end
  end
end
