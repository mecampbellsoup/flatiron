require 'awesome_print'

def reverse_each_word(sentence)
  reversed_array = sentence.split(" ").collect do |word|
    word.reverse
  end
  reversed_array.join(" ")
end

# reverse_each_word("Hello there, and how are you?")
#=> "olleH ,ereht dna woh era ?uoy"

ap reverse_each_word("Hello there, and how are you?")
#assert_equal "olleH ,ereht dna woh era ?uoy", reverse_each_word("Hello there, and how are you?")
