require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    assert_not !user.save
  end

  test 'should not save user without password' do
    user = User.new
    assert_not !user.save(email: 'testing@email.com')
  end

  test 'should save user with email and password' do
    user = User.new
    assert user.save(email: 'example@email.com', password: 'z0m3p4zsw0rd')
  end
end
