require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  test "invalid attributes" do
    category = Category.new
    assert !category.valid?
    assert category.errors.invalid?(:name)
    assert category.errors.invalid?(:description)
    
   end
   
end
