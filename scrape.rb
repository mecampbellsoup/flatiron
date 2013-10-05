require './student_profiles_rake.rb'
require 'pry'
require 'awesome_print' 


matt = Student.new("matt")
matt.scrape_data
matt.show_data  #=> this should show all the data I scraped but only that scraped data
#matt.save_scraped_data