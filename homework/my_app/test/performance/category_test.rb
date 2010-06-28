=begin
   Author: Charu Jain
   Homework 10: 
   Description: add performance tests 
   Usage: rake test:benchmark or
		  rake test:profile   or
          ruby -I test test/performance/category_test.rb   

=end

require 'test_helper'
require 'performance_test_help'

class CategoryTest < ActionController::PerformanceTest
  
  #index page
  def test_index
    get '/categories'
  end
  
  #show a particular category
  def test_show
    get '/category/1'
  end
  
end
