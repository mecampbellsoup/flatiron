require './student_profiles_rake.rb'
require 'pry'
require 'awesome_print'
require 'sqlite3'


mike = Student.new("mike")
mike.scrape_data
mike.show_data  #=> this should show all the data I scraped but only that scraped data
#matt.save_scraped_data

db = SQLite3::Database.new('db_student_profiles.db')

table = db.execute("CREATE TABLE students(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  social_links TEXT,
  education TEXT,
  quote TEXT,
  work TEXT,
  biography TEXT,
  code_profiles TEXT,
  personal_projects TEXT
  );
  ")

# db.execute("INSERT INTO students (name, social_links, education, personal_projects, quote, work, biography, code_profiles) VALUES
#   (#{mike.full_name}, #{mike.social_links}, #{mike.education}, #{mike.personal_projects}, #{mike.quote}, #{mike.work}, #{mike.biography}, #{mike.code_profiles});
#   ")
binding.

db.execute("INSERT INTO students (name) VALUES (#{mike.full_name});")