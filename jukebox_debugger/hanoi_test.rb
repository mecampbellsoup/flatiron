def move_disk(number_of_disks, from, to, via)
  # when you have one disk left you're done.
  # so stop recursing.
  counter = 0
  if number_of_disks == 1
    to.push(from.pop)
  else
    # "move n-1 discs from A to B"
    via.push(from.pop)
    # actually do the 'n-1' mentioned in other steps
    # and repeat the process
    move_disk(number_of_disks - 1, from, to, via)
    # "move n-1 from B to C"
    to.push(via.pop)
    counter +=1
  end
  to
end

move_disk(3, from, to, via)
puts counter