require 'pry'
require_relative './song_library.rb'

def jukebox(command)
  if command.downcase == "list"
    list_library
  else
    parse_command(command)
  end
end

def list_library
  lib = full_library
  lib.each do |artist, album_hash|
    puts list_artist(artist, album_hash)
  end
end

def list_artist(artist, album_hash)
  artist_list = "\n---------------\n"
  artist_list += "#{artist}:\n"
  artist_list += "---------------"
  album_hash[:albums].each do |album_name, songs_hash|
    artist_list += "\n#{album_name}:\n\t"
    artist_list += songs_hash[:songs].join("\n\t")
   end
   artist_list
end 

def parse_command(command)
  parse_artist(command, full_library) || play_song(command, full_library) || not_found(command)
end

def parse_artist(command, lib)
  cmd = command.split.map(&:capitalize).join(' ').to_sym
  parsed = false
  if lib.has_key?(cmd)
    puts list_artist(command, lib[cmd])
    parsed = true
  else
    lib.each do |artist, hash|
      if command.downcase == artist.to_s.gsub("_"," ").downcase
        puts list_artist(artist, hash)
        parsed = true
        break
      end
    end
  end
  parsed
end

def play_song(command, lib)
  cmd = command.split.map(&:capitalize).join(' ').to_sym
  lib.each do |artist, hash|
    hash.each do |album_name, albums_hash|
      albums_hash.each do |album, songs_hash|
        songs_hash.each do |songs, songs_array|
          songs_array.each do |song|
            if song.downcase == cmd.to_s.downcase
              puts "Now Playing: #{lib[cmd].strip}: #{album} - #{song}\n\n"
              return true
            end
          end
        end
      end
    end
  end
  false
end

def not_found(command)
  puts "I did not understand '#{command}'!\n\n"
  true
end