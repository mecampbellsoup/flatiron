# assignment.rb

# FizzBuzz - The Programmer's Stairway to Heaven
# Define the fizzbuzz method to do the following: 10pts
  # Use the modulo % method (divisible by)
    # 2 % 2 #=> true
    # 1 % 2 #=> false
  # If a number is divisible by 3, puts "Fizz".
  # If a number is divisible by 5, puts "Buzz".
  # If a number is divisible by 3 and 5, puts "FizzBuzz"
    # Use if statements 2pts
    # Use the && operator 3pts

# Write a loop that will group the numbers from 1 through 50
# by whether they fizz, buzz, or fizzbuzz - 10pts

def fizz_buzz num
  puts "FizzBuzz" if num % 15 == 0
  puts "Fizz" if num % 3 == 0
  puts "Buzz" if num % 5 == 0
  puts num
end

(1..50).each do |n|
  fizz_buzz n
end