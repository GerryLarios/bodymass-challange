require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should no save user without email' do
    user = User.new
    assert_not user.save
  end
end
