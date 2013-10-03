require 'pry'

game = {
  :home_team => {
    :team_name => "Heat",
    :team_colors => ["red", "black"],
    :players =>
    [  
      {:player_name => "Lebron James",
      :number => 23,
      :shoe_size => 13,
      :stats => {
        :points => 27,
        :rebounds => 10,
        :assists => 8,
        :steals => 3,
        :blocks => 2,
        :slam_dunks => 5
        }
      },

      {:player_name => "Dwyane Wade",
      :number => 5,
      :shoe_size => 12,
      :stats => {
        :points => 15,
        :rebounds => 8,
        :assists => 4,
        :steals => 1,
        :blocks => 0,
        :slam_dunks => 0
        }
      },

      {:player_name => "Mike Miller",
      :number => 33,
      :shoe_size => 14,
      :stats => {
        :points => 15,
        :rebounds => 8,
        :assists => 4,
        :steals => 1,
        :blocks => 0,
        :slam_dunks => 0
        }
      }
    ]
  },

  :away_team => {
    :team_name => "Knicks",
    :team_colors => ["blue", "orange"],
    :players =>
    [  
      {:player_name => "Carmelo Anthony",
      :number => 23,
      :shoe_size => 13,
      :stats => {
        :points => 40,
        :rebounds => 10,
        :assists => 8,
        :steals => 3,
        :blocks => 2,
        :slam_dunks => 5
        }
      },

      {:player_name => "Tyson 'Long Name' Chandler",
      :number => 5,
      :shoe_size => 18,
      :stats => {
        :points => 15,
        :rebounds => 20,
        :assists => 4,
        :steals => 10,
        :blocks => 0,
        :slam_dunks => 0
        }
      },

      {:player_name => "Mike Bibby",
      :number => 33,
      :shoe_size => 10,
      :stats => {
        :points => 15,
        :rebounds => 8,
        :assists => 4,
        :steals => 1,
        :blocks => 0,
        :slam_dunks => 0
        }
      }
    ]
  }
}

# Using the power of Ruby, and the Hashes you created above, answer the following questions:
# Return the number of points scored for any player:
#
def points_scored_for_player(name,game)
  game[:home_team][:players].each do |player_hash|
    return player_hash[:stats][:points] if player_hash[:player_name] == name
  end
  game[:away_team][:players].each do |player_hash|
    return player_hash[:stats][:points] if player_hash[:player_name] == name
  end
end

p points_scored_for_player("Lebron James", game)

def shoe_size_for_any_player(name, game)
  game[:home_team][:players].each do |player_hash|
    return player_hash[:shoe_size] if player_hash[:player_name] == name
  end
  game[:away_team][:players].each do |player_hash|
    return player_hash[:shoe_size] if player_hash[:player_name] == name
  end
end

p shoe_size_for_any_player("Lebron James", game)
p shoe_size_for_any_player("Mike Miller", game)

# # Return both colors for any team:

def team_colors(team_name, game)
  return game[:home_team][:team_colors] if game[:home_team][:team_name] == team_name
  return game[:away_team][:team_colors] if game[:away_team][:team_name] == team_name
end

# # Return both teams names:

def both_team_names(game)
  both_teams = []
  both_teams << game[:home_team][:team_name]
  both_teams << game[:away_team][:team_name]
  both_teams
end

p both_team_names(game)

# # Return all the player numbers for a team:
def all_players_for_a_team(team_name, game)
  player_names = []
  game[:home_team][:players].each do |player_hash|
    player_names << player_hash[:player_name] if game[:home_team][:team_name] == team_name
  end
  game[:away_team][:players].each do |player_hash|
    player_names << player_hash[:player_name] if game[:away_team][:team_name] == team_name
  end
  player_names
end

p all_players_for_a_team("Heat", game)

# Return all the stats for a player:
def all_stats_for_player(name, game)
  game[:home_team][:players].each do |player_hash|
    return player_hash[:stats] if player_hash[:player_name] == name
  end
  game[:away_team][:players].each do |player_hash|
    return player_hash[:stats] if player_hash[:player_name] == name
  end
end

p all_stats_for_player("Lebron James", game)

# Return the rebounds for the player with the largest shoe size
def rebounds_for_player_with_largest_shoe_size(game)
  shoe_sizes_with_player_names = []
  game[:home_team][:players].each do |player_hash|
    shoe_sizes_with_player_names << {player_hash[:player_name] => player_hash[:shoe_size]}
  end
  game[:away_team][:players].each do |player_hash|
    shoe_sizes_with_player_names << {player_hash[:player_name] => player_hash[:shoe_size]}
  end
  biggest_shoe_size = {"test" => 0}
  shoe_sizes_with_player_names.each do |shoe_size_and_name_hash|
    biggest_shoe_size = shoe_size_and_name_hash if shoe_size_and_name_hash.values[0] > biggest_shoe_size.values[0]
  end
  game[:home_team][:players].each do |player_hash|
    return player_hash[:stats][:rebounds] if player_hash[:player_name] == biggest_shoe_size.keys[0]
  end
  game[:away_team][:players].each do |player_hash|
    return player_hash[:stats][:rebounds] if player_hash[:player_name] == biggest_shoe_size.keys[0]
  end
end

p rebounds_for_player_with_largest_shoe_size(game)

# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?
def most_points(game)
  player_name_with_points = []
  game[:home_team][:players].each do |player_hash|
    player_name_with_points << {player_hash[:player_name] => player_hash[:stats][:points]}
  end
  game[:away_team][:players].each do |player_hash|
    player_name_with_points << {player_hash[:player_name] => player_hash[:stats][:points]}
  end
  player_most_points = {"test" => 0}
  player_name_with_points.each do |name_and_points_hash|
    player_most_points = name_and_points_hash if name_and_points_hash.values[0] > player_most_points.values[0]
  end
  player_most_points.keys[0]
end

def most_steals(game)
  player_name_with_steals = []
  game[:home_team][:players].each do |player_hash|
    player_name_with_steals << {player_hash[:player_name] => player_hash[:stats][:steals]}
  end
  game[:away_team][:players].each do |player_hash|
    player_name_with_steals << {player_hash[:player_name] => player_hash[:stats][:steals]}
  end
  player_most_steals = {"test" => 0}
  player_name_with_steals.each do |name_and_steals_hash|
    player_most_steals = name_and_steals_hash if name_and_steals_hash.values[0] > player_most_steals.values[0]
  end
  player_most_steals.keys[0]
end

p most_points(game)
p most_steals(game)
# Which team has the most points?
def team_with_more_points(game)
  home_points = game[:home_team][:players].collect do |player|
    player[:stats][:points]
  end.inject {|sum, n| sum + n}
  away_points = game[:away_team][:players].collect do |player|
    player[:stats][:points]
  end.inject {|sum, n| sum + n}
  home_points > away_points ? game[:home_team][:team_name] : game[:away_team][:team_name]
end

p team_with_more_points(game)
# Which player has the longest name?

def player_longest_name(game)
  player_names = []
  game[:home_team][:players].each do |player_hash|
    player_names << player_hash[:player_name]
  end
  game[:away_team][:players].each do |player_hash|
    player_names << player_hash[:player_name]
  end
  longest_name = player_names.max_by { |name| name.length }
end

p player_longest_name(game)
# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals:

def player_with_longest_name_also_had_most_steals?(game)
  player_longest_name(game) == most_steals(game)
end

p player_with_longest_name_also_had_most_steals?(game)
