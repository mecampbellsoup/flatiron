require 'nokogiri'
require 'open-uri'
require 'pry'

# this code gets me each student's unique profile url (in array)

index_url = "http://students.flatironschool.com/"

doc = Nokogiri::HTML(open(index_url))

test_urls = doc.css("div.blog-thumb a").collect do |student|
  student.attr('href')
end

student_urls = doc.css("div.blog-thumb").collect do |student|
  student.css('a').attr('href').value
end

# now get info from a student profile

student_url = "http://students.flatironschool.com/students/matt_campbell.html"

student_doc = Nokogiri::HTML(open(student_url))

full_name = student_doc.css('h4.ib_main_header').children.to_s

biography = student_doc.css('div.services').children.css('p')

work_blurb = student_doc.css('div#ok-text-column-4').css('li')

binding.pry



