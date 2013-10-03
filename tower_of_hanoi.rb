require 'pry'

# Move the disks from one peg to another following the rules of Hanoi.
#
# number_of_disks - the total number of disks
# from - the starting peg
# to - the ending (goal) peg
# via - the remaining peg (b in this case)
#
peg1 = [1,2,3]
peg2 = []
peg3 = []

puts "welcome to the tower of hanoi!"
puts "starting peg situation:"
puts "peg1 = #{peg1}"
puts "peg2 = #{peg2}"
puts "peg3 = #{peg3}"

def move_disk(num_disks, from, via, to)

  if from.size == 1
    #move the bottom ring to peg3
    to.push(from.pop)
    puts "That was a move!"
  else
    #first move top ring to middle
    via.push(from.pop)
    puts "That was a move!"
    move_disk(num_disks - 1, from, via, to)
    to.push(via.pop)
    puts "That was a move!"
  end

end

move_disk(3, peg1, peg2, peg3)

puts "ending peg situation:"
puts "peg1 = #{peg1}"
puts "peg2 = #{peg2}"
puts "peg3 = #{peg3}"