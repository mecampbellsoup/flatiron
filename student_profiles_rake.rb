require 'nokogiri'
require 'open-uri'
require 'pry'
require 'awesome_print'

class Student

  attr_accessor :student_ext, :student_url, :student_doc, :name,
                :social_links, :education, :quote, :full_name,
                :personal_projects, :work, :biography, :code_profiles

  def initialize(name)
    @name = name
  end

  def get_students  # this method gets me each student's unique profile url (in array)
    Nokogiri::HTML(open("http://students.flatironschool.com/")).css("div.blog-thumb a").collect do |student|
      student.attr('href')
    end
  end

  def scrape_data
    self.student_ext = get_students.select {|student_url| student_url if student_url.include? self.name }.join
    self.student_url = "http://students.flatironschool.com/#{self.student_ext}" unless self.student_ext.nil?
    self.student_doc = Nokogiri::HTML(open(self.student_url)) # unique student profile url
  
    # next call the other scraping methods in here
    self.full_name = scrape_full_name
    self.social_links = scrape_social_links
    self.education = scrape_education
    self.personal_projects = scrape_personal_projects
    self.quote = scrape_quote
    self.work = scrape_work
    self.biography = scrape_biography
    self.code_profiles = scrape_code_profiles
  end

  def show_data  # choose the data I want to show in this method
    ap "Name: #{self.full_name}"
    ap "Social: #{self.social_links}"
    ap "Education: #{self.education}"
    ap "Projects: #{self.personal_projects}"
    ap "Quote: #{self.quote}"
    ap "Work: #{self.work}"
    ap "Bio: #{self.biography}"
    ap "Coder Cred: #{self.code_profiles}"
  end

  def scrape_full_name
    self.student_doc.css('h4.ib_main_header').children.text
  end

  def scrape_social_links
    self.student_doc.css('div.social-icons a').collect do |social|
      social.attr('href') unless social.attr('href') == "#"
    end.compact.join(", ") # now I have a string of social links, yay!
  end
  
  def scrape_personal_projects
    self.student_doc.css('h3').each_with_index do |section_title, i|
      if section_title.text.strip.downcase == "personal projects"
        self.personal_projects = section_title.parent.parent.css('p').collect { |pp| pp.text }.join(", ")
      end
    end
    self.personal_projects
  end

  def scrape_education
    self.student_doc.css('h3').each_with_index do |section_title, i|
      if section_title.text.strip.downcase == "education"
        self.education = section_title.parent.parent.css('ul').text.strip
        #section_title.parent.parent.css('p')
      end
    end
    self.education
  end
  
  def scrape_quote
    self.student_doc.css('div.textwidget h3').text
  end

  def scrape_work
    self.student_doc.css('h3').each_with_index do |section_title, i|
      if section_title.text.strip.downcase == "work"
        if section_title.parent.parent.css('p').collect { |pp| pp.text }.join(", ").strip.empty?
          self.work = section_title.parent.parent.css('li').collect { |pp| pp.text }.join(", ")
        else
          self.work = section_title.parent.parent.css('p').collect { |pp| pp.text }.join(", ").strip
        end
      end
    end
    self.work
  end

  def scrape_biography
    self.student_doc.css('h3').each_with_index do |section_title, i|
      if section_title.text.strip.downcase == "biography"
        if section_title.parent.parent.css('p').collect { |pp| pp.text }.join(", ").strip.empty?
          self.biography = section_title.parent.parent.css('li').collect { |pp| pp.text }.join(", ")
        else
          self.biography = section_title.parent.parent.css('p').collect { |pp| pp.text }.join(", ").strip
        end
      end
    end
    self.biography
  end

  def scrape_code_profiles
    self.student_doc.css('h3').each_with_index do |section_title, i|
      if section_title.text.strip.downcase == "coding profiles"
        self.code_profiles = section_title.parent.parent.css('p a').collect { |cp| cp.attr('href') }.join(", ")
      end
    end
    self.code_profiles
  end

end