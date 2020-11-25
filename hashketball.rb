# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

# def num_points_scored(player)
#   count = 0
#   while count < 9 do
#     if game_hash[:home][:players][count][:player_name] == player
#       return game_hash[:home][:players][count][:points]
#     elsif game_hash[:away][:players][count][:player_name] == player
#       return game_hash[:away][:players][count][:points]
#     else
#       count += 1
#     end
#   end
# end

# def num_points_scored(player_name)
#   points_scored = 0
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |player_data|
#       if player_data[:player_name] == player_name
#          points_scored = player_data[:points]
#       end
#     end
#   end
#   points_scored
# end

def num_points_scored(player_name)
    game_hash.each do |location, team_data|
      matching_player = team_data[:players].find { |player| player[:player_name] == player_name }
      if matching_player
        return matching_player[:points]
      end
    end
  end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    matching_player = team_data[:players].find { |player| player[:player_name] == player_name }
    if matching_player
      return matching_player[:shoe]
    end
  end
end

# def team_colors(name_arg)
#   game_hash.each do |location, team_data|
#     if team_data[:team_name] == name_arg
#       return team_data[:colors]
#     end
#   end
# end

def team_colors(name_arg)
  matching_team = game_hash.values.find {|team_data| team_data[:team_name] == name_arg}
  matching_team[:colors]
end


def team_names
  # (game_hash[:home][:team_name] + ", " + game_hash[:away][:team_name]).split(", ")
  game_hash.map { |location, value| value[:team_name] }
end

def player_numbers(team_name)
  team_hash = game_hash.values.find { |location| location[:team_name] == team_name }
  team_hash[:players].map { |player| player[:number] }
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    matching_player = team_data[:players].find { |player| player[:player_name] == player_name }
    if matching_player
      return matching_player
    end
  end
end

# def big_shoe_rebounds
#   shoe_size = 0
#   rebounds = 0
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |player|
#       if player[:shoe] > shoe_size
#         shoe_size = player[:shoe]
#         rebounds = player[:rebounds]
#       end
#     end
#   end
#   rebounds
# end

def player_with_highest(stat_sym)
  player_arr = game_hash.each.with_object([]) { |(k, v), arr| arr.concat(v[:players])}
  player_arr.max_by { |player| player[stat_sym] }
end

def big_shoe_rebounds
  big_shoe_player = player_with_highest(:shoe)
  big_shoe_player[:rebounds]
end


# def most_points_scored
#   points = 0
#   mvp = ""
#   game_hash.each do |location, team_data|
#     team_data[:players].each do |player|
#       if player[:points] > points
#         points = player[:points]
#         mvp = player[:player_name]
#       end
#     end
#   end
#   mvp
# end

def most_points_scored
  mvp = player_with_highest(:points)
  mvp[:player_name]
end

def most_steals
  player_with_highest(:steals)[:player_name]
end

# def winning_team
#   home_points = game_hash[:home][:players].sum { |player| player[:points] }
#   away_points = game_hash[:away][:players].sum { |player| player[:points] }
#
#   home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
# end

# def winning_team
#   home_points = game_hash[:home][:players].sum { |player| player[:points] }
#   away_points = game_hash[:away][:players].sum { |player| player[:points] }
#
#   home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
# end

# def winning_team
#   home_points = 0
#   away_points = 0
#   game_hash[:home][:players].each do |player|
#     home_points += player[:points]
#   end
#   game_hash[:away][:players].each do |player|
#     away_points += player[:points]
#   end
#   if home_points > away_points
#     return game_hash[:home][:team_name]
#   else
#     return game_hash[:away][:team_name]
#   end
# end

def winning_team
  winner = game_hash.values.max_by { |team_data| team_data[:players].sum{ |player| player[:points] } }
  winner[:team_name]
end

def player_with_longest_name
  players_arr = game_hash.each.with_object([]) { |(k, v), arr| arr.concat(v[:players]) }
  player = players_arr.max_by {|player| player[:player_name].length}
  player[:player_name]
end

def long_name_steals_a_ton?
  player_with_longest_name() == most_steals()
end

# def specific_stat_available(specific_stat)
#   game_hash.values.any? do |team_data|
#     team_data[:players].any? { |player| player.keys.include?(specific_stat.to_sym) }
#   end
# end
#
# # puts specific_stat_available('turnovers')
