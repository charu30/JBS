=begin
   Author: Charu Jain
   Homework 10: 
   Description: add unit tests 
   Usage: rake test:units or 
          ruby -I test test/unit/category_test.rb   

=end


require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  #include fixtures from categories.yml and notes.yml
  fixtures :categories
  fixtures :notes

  #check for invalid attributes
  test "invalid attributes" do
    category = Category.new
    assert !category.valid?
    #assert category.errors.invalid?(:name)
    assert category.errors.invalid?(:description)
  end  
  
  #check to add a note to a category
  test "add_note_category" do 
    #add a category
	category = Category.new(:name => "jbs homework", :description => "project and individual hw")
	category.save();
	#save note to a category
	note = Note.new(:title => "blog", :description => "write blog on scrum")
	category.notes << note
   end
   
  #Test using fixtures
  test "add_multiple_notes" do 
	
	category_one = categories(:one)
    assert category_one.valid?
	#check if category has any notes
    assert category_one.notes.empty?
	#add two notes
	note_one = notes(:grocery)
	note_two = notes(:clean)
	category_one.notes << note_one
	category_one.notes << note_two
    #Check if category_one has two notes now
	assert_equal 2, category_one.notes.size
   end
      
end
