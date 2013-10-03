def prime?(num)
  # I know a number is prime if its factors are only equal to itself and 1
  # I know a number is not prime if it has factors other than 1 and itself
  # I know I only need to check numbers up to num/2 because everything above that is implicitly checked when we check 2
  tries = 0 # keep track of efficiency
  prime = true
  prime = false if num.even? || 
  checker = 3
  while checker < num**0.5
    if num % checker == 0
      prime = false and break
    end
    checker += 2
    tries += 1
  end
  puts "#{num} is #{prime ? "prime" : "not prime"}."
  puts "This algorithm required #{tries} tries to solve."
  #prime
end

prime?(10007) #=> true
prime?(600851475143) #=> ??
# p prime?(3) #=> true
# p prime?(51) #=> false
# p prime?(100) #=> false
# p prime?(7919) #=> true
# p prime?(6197) #=> true