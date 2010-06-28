require 'test_helper'

class FriendTest < ActiveSupport::TestCase
 
 # test for invalid attributes
  test "invalid attributes" do
    friend = Friend.new
    assert !friend.valid?
    assert friend.errors.invalid?(:name)
    assert friend.errors.invalid?(:since)
	assert friend.errors.invalid?(:comment)
	assert friend.errors.invalid?(:group)
  end  
 
end
