# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should create a user with a valid email and password' do
    user = User.new(email: 'test@example.com', password: 'password', name: 'Test User')
    assert user.save, 'User could not be saved'
  end

  test 'should not create a user without an email' do
    user = User.new(password: 'password', name: 'Test User')
    assert_not user.save, 'User was saved without an email'
  end

  test 'should not create a user without a password' do
    user = User.new(email: 'test@example.com', name: 'Test User')
    assert_not user.save, 'User was saved without a password'
  end

  test 'should not create a user without a name' do
    user = User.new(email: 'test@example.com', password: 'password')
    assert_not user.save, 'User was saved without a name'
  end

  test 'should create an inbox project after user creation' do
    user = User.create(email: 'test@example.com', password: 'password', name: 'Test User')

    assert_equal 1, user.projects.where(is_inbox: true).count
    assert_equal 'Inbox', user.projects.find_by(is_inbox: true).name
  end
end
