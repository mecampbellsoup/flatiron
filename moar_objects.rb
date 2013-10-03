class Test
  attr_accessor :name

  puts "I am Ruby reading the class #{self}"

  def initialize(name)
    puts "A new test was made!"
    #self.name = name
    @name = name

  end

  puts self.class
end