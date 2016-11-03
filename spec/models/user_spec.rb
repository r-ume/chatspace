require 'rails_helper'

RSpec.describe User, type: :model do
  it 'sees if the user is valid or not' do
    expect(build(:user)).to be_valid
  end
end

