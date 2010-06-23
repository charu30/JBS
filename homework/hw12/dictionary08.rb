=begin 
Author: Charu Jain 
Homework 12
Description: Added a function to calcualte the number of words in a dictionary 
Usage: ruby dictionar08.rb
=end

require 'test/unit'
require 'rubygems'
require 'mocha'

# Design a class to represent a dictionary
class Dictionary
  
# We know that the dictionary starts out empty
  def initialize
    @dictionary = {}
  end

# Don't know yet how I will represent info
  def empty?
    @dictionary.empty?
  end
  
  def add_translation(english, otherlanguage)
    @dictionary[otherlanguage] = english
  end
  
  def translate(otherlanguage)
    @dictionary[otherlanguage]
  end
  
  def remove_translation(otherlanguage)
    a = @dictionary.delete(otherlanguage)
  end
  
  def count_words
    @dictionary.length
  end
 end

    
# Test the class as we develop it
class DictionaryTest < Test::Unit::TestCase
  
  def setup
    @dict = Dictionary.new
  end

# Check that a new dictionary is empty
  def test_empty_dict
    assert @dict .empty?
  end

# Check that once you add at least one translation it is not empty  
  def test_adding_xlate
    @dict.add_translation("book", "boek")
    assert !@dict.empty?
  end
  
# Check that I can fetch the translation I adde@dict.
  def test_add_fetch_xlate
    @dict.add_translation("book", "boek")
    book = @dict.translate("boek")
    assert_equal "book", book, "expected translation to be book"
  end
  
# Let's check two translations
  def test_add_two_xlates
    @dict.add_translation("book", "boek")
    @dict.add_translation("house", "huis")
    assert !@dict.empty?
    assert_equal "book", @dict.translate("boek")
    assert_equal "house", @dict.translate("huis")
  end
  
 #Check if I can remove a translation 
  def test_remove_xlate 
    @dict.add_translation("book", "boek")
	@dict.remove_translation("boek")
	assert @dict.empty?
	assert_equal nil, @dict.translate("boek")
  end 
  
  #Check if I can count the number of words in a dictionary
  def test_count_words_dictionary
	@dict.add_translation("cow","coe")
	assert_equal 1, @dict.count_words
	@dict.add_translation("hello","heilo")
	assert_equal 2,@dict.count_words
  end
 
end
