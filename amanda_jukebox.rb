  $songs = [
    "The Phoenix - 1901",
    "Tokyo Police Club - Wait Up",
    "Sufjan Stevens - Too Much",
    "The Naked and the Famous - Young Blood",
    "(Far From) Home - Tiga",
    "The Cults - Abducted",
    "The Phoenix - Consolation Prizes"
  ]

  def instructions
    puts "Welcome to Team Middle's Jukebox!"
    system("say welcome to team middles jukebox")
    puts "-- Type 'help' to get instructions."
    puts "-- Type 'list' to see list of songs."
    puts "-- Type 'play' to select a song."
    puts "-- Type 'exit' turn off jukebox."
  end

  def list(song_array)
    song_array.each_with_index do |song, i|
      puts "#{i+1}. #{song}"
    end
  end

  def play(song_array)
    puts "What song would you like to play?"
    system("say what song would you like to play")
    loop do
      song_selection = gets.chomp
      case song_selection.downcase
      when "1", "1901"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=gvss3uhSKjw")
      when "2", "wait up"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=ZAxRozTgoXM")
      when "3", "too much"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=K0g7R3xqdcM")
      when "4", "young blood"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=0YuSg4mts9E")
      when "5", "tiga"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=jTwQbc9kkUc")
      when "6", "abducted"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=9i1MXHGB8g0")
      when "7", "consolation prizes"
        puts "Playing #{song_array[song_selection.to_i-1]}..."
        system("open -g https://www.youtube.com/watch?v=gnkVUReUVpQ")
      when "list"
        list($songs)
      when "help"
        instructions
      when "exit"
        return "exit"
      else
        puts "Song not found! Please select type 1-7 or song name."
      end
    end
  end

  def suggestion(input)
    valid_commands = %w(help play list exit)
    valid_commands.each do |command|
      command_chars = command.split("")
      perms_arr = command_chars.permutation.to_a
      command_perms = perms_arr.map {|perm| perm.join}
      puts "Did you mean #{command}?" if (command_perms.include?(input))
    end
  end
  # def sugg(in)
  #   out =[]
  #   ["help","list","play", "exit"].each do |x|
  #     out = x.scan(in)
  #     if out.length >= 2 
  #       out << x
  #     end
  #   end
  #   out.join(" ")
  # end

  instructions
  loop do 
    user_input = gets.chomp
    case user_input
    when "help"
      instructions
    when "list"
      list($songs)
      puts
      puts "Type 'play' to select a song."
    when "play"
      list($songs)
      play($songs)
      break #the play loop returns here and then breaks to exit program
    when "exit"
      puts "Goodbye!"
      system("say goodbye")
      break
    else
      puts "Invalid input. Please type 'help' for instructions."
      suggestion(user_input)
      system("say invalid input")
    end
  end