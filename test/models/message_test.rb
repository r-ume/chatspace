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

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
