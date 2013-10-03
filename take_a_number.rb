def take_a_number(current_line, name)
  current_line << name
  puts current_line.index(name)+1
end

def now_serving(current_line)
  puts "Currently serving #{current_line.first}"
  current_line.shift
end

def line(current_line)
  current_line.each_with_index do |p,i|
    print "#{i+1}. #{p.capitalize}"
    if i < current_line.size-1
      print " "
    else
      puts ""
    end
  end
end

katz_deli = []

take_a_number(katz_deli, "Matt")
take_a_number(katz_deli, "Logan")
take_a_number(katz_deli, "Manuel")

line(katz_deli)

now_serving(katz_deli)

line(katz_deli)