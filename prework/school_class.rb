require 'pry'
require 'awesome_print'
require './student_class'

class School
  # g. Create an array constant SCHOOLS that stores all instances of your School class.
  # the below + initialize method seems to achieve this, but what about changes to the school objects after initialize?
  SCHOOLS = []

  attr_accessor :name, :location, :students, :instructors
  attr_reader :ranking
  attr_writer :ranking

  def initialize args=[name_key_value,location_key_value,ranking_key_value,students_array,instructors_array]
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    SCHOOLS << self
  end

  def set_ranking(ranking_value)
    self.ranking = ranking_value
    #all this needed was attr_writer for :ranking
  end

  def add_student_to_school(new_student_name, new_student_grade, semester)
    new_student = Student.new(name: new_student_name, grade: new_student_grade, semester: semester)
    self.students << new_student
  end

  # f. Create a method to remove a student from the school, given a name.
  def remove_student_from_school(student_name)
    self.students.delete_if do |student|
      student.name == student_name
    end
  end

  # h. Create a class method reset that will empty the SCHOOLS constant.
  def self.reset_schools_constant
    SCHOOLS.delete_if do |i|
      true
    end
  end
end

school = School.new(name: "Roosevelt", location: "NYC", students: [Student.new(name: "Matt", grade: "A", semester: "Fall"), Student.new(name: "Sean", grade: "C", semester: "Fall")], instructors: [{name: "Will", subject: "Ruby"}, {name: "Joe", subject: "iOS"}])
school.set_ranking(2)
school.add_student_to_school("LJ", "C+", "Fall")
school.remove_student_from_school("LJ")
ap school
School.reset_schools_constant
ap school




