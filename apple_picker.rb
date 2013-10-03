def apple_picker(array_of_fruits)
  array_of_fruits.select { |fruit| fruit == "apple" }
  # array_of_fruits.collect do |fruit|
  #   fruit if fruit == "apple"
  # end.compact
end

p apple_picker(["apple", "orange", "apple"]) #=> ["apple", "apple"]

# select vs. collect
# if a conditional requirement is not met within a collect iteration, the value returned
# is nil... in other words, select can and will return an array with fewer
# values than self.size