require 'awesome_print'
require 'pry'
# 6. Classes

# a. Create a Student class.

class Student
  attr_accessor :name, :semester, :grade
  def initialize args=[name, semester, grade]
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end

flatiron = Student.new(name: "Matt", semester: "Fall", grade: "n/a")

ap flatiron

# b. Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.

# c. Create a method in the School class that finds a student by name and returns the correct Student object.

# school = { 
#   :name => "Happy Funtime School",
#   :location => "NYC",
#   :instructors => [ 
#     {:name=>"Blake", :subject=>"being awesome" },
#     {:name=>"Ashley", :subject=>"being better than blake"},
#     {:name=>"Jeff", :subject=>"karaoke"}
#   ],
#   :students => [ 
#     {:name => "Marissa", :grade => "B"},
#     {:name=>"Billy", :grade => "F"},
#     {:name => "Frank", :grade => "A"},
#     {:name => "Sophie", :grade => "C"}
#   ]
# }