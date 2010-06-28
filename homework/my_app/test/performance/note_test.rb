=begin
   Author: Charu Jain
   Homework 10: 
   Description: add performance tests 
   Usage: rake test:benchmark or
		  rake test:profile   or 
          ruby -I test test/performance/note_test.rb   
=end

require 'test_helper'
require 'performance_test_help'

class NoteTest < ActionController::PerformanceTest
  #index page
  def test_index
    get '/notes'
  end
  
  #to get notes of a particular category
  def test_category
    get '/notes/category/JBS-homework'
  end
end
