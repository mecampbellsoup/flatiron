require 'pry'
require 'awesome_print'

# mattCampbell_assessment.rb
# 1. Arrays

array = ["Blake","Ashley","Jeff"]

# a. Add a element to an array

array[3] = "Matt"

# b. Write a statement to print out all the elements of the array.

array.each { |i| puts i }

# c. Return the value at index 1.

array[1]

# d. Return the index for the value "Jeff".

array.index("Jeff")


# 2. Hashes

instructor = {:name=>"Ashley", :age=>27}

# a. Add a new key for location and give it the value "NYC".

instructor[:location] = "NYC"

# b. Write a statement to print out all the key/value pairs in the hash

instructor.each {|key, value| p [key, value]}

# c. Return the name value from the hash.

instructor[:name]

# d. Return the key name for the value 27.

instructor.key(27)

# 3. Nested Structures

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}
# a. Add a key to the school hash called "founded_in" and set it to the value 2013.

school[:founded_in] = 2013

# b. Add a student to the school's students' array.

school[:students].push({name: "Matt", grade: "F"})
ap school

# c. Remove "Billy" from the students' array.

ap school[:students].select {|student_hash| student_hash[:name] != "Billy"}

# d. Add a key to every student in the students array called "semester" and assign it the value "Summer".

ap school[:students].each {|student| student[:semester] = "Summer"}

# e. Change Ashley's subject to "being almost better than Blake"

school[:instructors].select do |instructor_hash|
  if instructor_hash[:name] == "Ashley"
    instructor_hash[:subject] = "being almost better than Blake"
  end
end

ap school

# f. Change Frank's grade from "A" to "F".

school[:students].select do |student_hash|
  if student_hash[:name] == "Frank"
    student_hash[:grade] = "F"
  end
end

ap school

# g. Return the name of the student with a "B".

school[:students].select {|student_hash| puts student_hash[:name] if student_hash.key("B")}

# h. Return the subject of the instructor "Jeff".

school[:instructors].select {|instructor_hash| puts instructor_hash[:subject] if instructor_hash[:name] == "Jeff"}

# i. Write a statement to print out all the values in the school. ***FLAG

school.each do |key,value|
  if value.class == Array
    value.each do |hash|
      hash.each_value {|value| puts value}
    end
  else
    puts value
  end
end

# 4. Methods

# Note: You will need to pass the school variable to each of these methods to include it in scope.

# a.i. Create a method to return the grade of a student, given that student's name. ii. Then use it to refactor your work in 3.i.

def return_student_grade(name, school)
  school[:students].select {|student_hash| ap student_hash[:grade] if student_hash[:name] == name}
end

return_student_grade("Marissa", school)

# b. i.Create a method to udpate an instructor's subject given the instructor and the new subject. ii. Then use it to update Blake's subject to "being terrible".

def update_instructor_subject(instructor, new_subject, school)
  school[:instructors].select do |instructor_hash| 
    if instructor_hash[:name] == instructor
      ap instructor_hash[:subject] = new_subject
    end
  end
end

update_instructor_subject("Blake", "being terrible", school)

# c. i. Create a method to add a new student to the schools student array. ii. Then use it to add yourself to the school students array.

def add_new_student_to_schools_student_array(new_student_name, new_student_grade, school)
  new_student = {name: new_student_name, grade: new_student_grade}
  #school[:students].push(new_student)
  school[:students][school[:students].size] = new_student
  school
end

ap add_new_student_to_schools_student_array("Tom", "B", school)

# d. i. Create a method that adds a new key at the top level of the school hash, given a key and a value. ii. Then use it to add a "Ranking" key with the value 1.

def new_key_value_pair_at_top_level_of_school_hash(new_key, new_value, school)
  new_pair = {new_key.downcase.to_sym => new_value}
  ap new_pair.merge!(school)
end

new_key_value_pair_at_top_level_of_school_hash("Ranking", 1, school)

# 5. Object Orientation

class School
  attr_accessor :name, :location, :students, :instructors
  attr_reader :ranking
  attr_writer :ranking

  def initialize args=[name_key_value,location_key_value,ranking_key_value,students_array,instructors_array]
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    binding.pry
    SCHOOLS << self
  end

  def set_ranking(ranking_value)
    self.ranking = ranking_value
    #all this needed was attr_writer for :ranking
  end

  def add_student_to_school(new_student_name, new_student_grade, semester)
    new_student = {name: new_student_name, grade: new_student_grade, semester: semester}
    self.students << new_student
  end

  # f. Create a method to remove a student from the school, given a name.
  def remove_student_from_school(student_name)
    self.students.delete_if do |student|
      student[:name] == student_name
    end
  end

  # g. Create an array constant SCHOOLS that stores all instances of your School class.
  # the below + initialize method seems to achieve this, but what about changes to the school objects after initialize?
  SCHOOLS = []

  # h. Create a class method reset that will empty the SCHOOLS constant.
  def self.reset_schools_constant
  end
end

# 6. Classes

# a. Create a Student class.

# b. Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.

# c. Create a method in the School class that finds a student by name and returns the correct Student object.