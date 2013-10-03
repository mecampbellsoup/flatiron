require 'pry'

# Download Gist: https://gist.github.com/scottcreynolds/e6534b284373efe0ba6e/download
# Build a Jukebox
 
# create a file jukebox.rb
 
# When that program is run, it should introduce itself
# to the user and accept input from the user using the gets command.
 
# The jukebox should respond to 4 commands, help, play, list and exit.
 
# The help command should output instructions for the user
# on how to use the jukebox.
 
# The list command should output a list of songs that the
# user can play.
 
# the play command should accept a song, either by number/index
# or name. Once the user has indicated which song they want to
# play, the jukebox should output 'Playing The Phoenix - 1901'
# or whatever song name is important.
 
# if the user types in exit, the jukebox should say goodbye
# and the program should shut down.
 
# Think about the following things
 
# How to keep the program running until the exit command is
# executed (Hint: Loop maybe? Loop upon a condition)
 
# How to normalize the user's input so LIST and list are the
# same. (Hint, maybe downcase and strip it)
 
# How to give the songs an "index" so that when you list them
# out, you can refer to them by position so the user can just
# type play 1 and then you find the first song. (Hint, check
# out a method called each_with_index)

songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

# Helper Methods =========

def exit
  puts "Goodbye!"
  "exit"
end

def list(songs)
  puts ""
  songs.each_with_index { |s,i| puts "##{i+1}: #{s}" }
end

def help
  puts "There are 4 options to choose from:".center(80, "*")
  puts "'play' a song - 'list' all song on the jukebox - 'help' - and 'exit'".center(80, "*")
end

def play(songs)
  puts "Cool, nice choice - which song?"
  list(songs)
  song_choice = gets.chomp.downcase
  if test_for_integer_or_string_input(song_choice) && song_choice.to_i < songs.size
    puts "Now playing: #{songs[(song_choice.to_i)-1]}"
  else
    potential_matches = []
    songs.each do |song|
      potential_matches << song if song.downcase[song_choice]
    end
    if potential_matches.size > 1 || potential_matches.size == 0
      puts "Sorry, could you be a bit more specific with your song choice please?"
      play(songs)
    else
      puts "Now playing: #{potential_matches[0]}"
    end
  end
end

def test_for_integer_or_string_input(song_choice)
  song_choice_begin = song_choice
  song_choice_end = song_choice.to_i.to_s
  song_choice_begin == song_choice_end  # integers return true; strings return false
end
# ==========================

def begin_prompt
  puts "Hello! Welcome to jukebox.io".center(80, "*")
  help
  puts "First of all, what's your name?".center(80, "*")
  @name = gets.downcase.strip
end

def jukebox(name, songs, counter)
  if counter == 0  
    puts "\nAwesome, thanks #{name}! Now please make a selection from one of the 4 options above."
  else
    puts "\nWord up - what would you like to do next master?"
  end  
  command = gets.downcase.strip
  case command
  when "list"
    list(songs)
  when "play"
    play(songs)
  when "help"
    help
  when "exit"
    exit
  else
    puts "Sorry, I don't recognize that command... could you try again please?"
  end
end

def jukebox_loop(name, songs, counter)
  @counter = -1
  loop do
    @counter += 1
    if jukebox(name, songs, @counter) == "exit"
      break
    end
  end
end

begin_prompt
jukebox_loop(@name, songs, @counter)