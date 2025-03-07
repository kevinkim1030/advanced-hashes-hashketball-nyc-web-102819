def game_hash
  {
    home: { team_name: 'Brooklyn Nets',
      colors: ["Black", "White"],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] 
  },
    away: { team_name: 'Charlotte Hornets',
      colors: ["Turquoise", "Purple"],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
      ] 
    }
  }
end

def num_points_scored(player_name)
  players = get_all_players
  player = find_player_by_name(players, player_name)
  player[:points]
end

def find_player_by_name(players, player_name)
  players.find do |player|
    player[:player_name] == player_name
  end
end

def get_all_players
  players = game_hash.values.map do |team|
    team[:players]
  end
  players.flatten
end

def shoe_size(player_name)
  players = get_all_players
  player = find_player_by_name(players, player_name)
  player[:shoe]
end

def team_colors(team_name)
  game_hash.each do |side, keys|
    if keys[:team_name] == team_name
      return keys[:colors].map
    end
  end
end

def team_names
  game_hash.map {|home_away, keys| keys[:team_name]}
end

def player_numbers(team_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == team_name
      return keys[:players].map { |player| player[:number] }
    end
  end
end

def player_stats(selected_player)
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      if player[:player_name] == selected_player
        return player.delete_if { |stat, value| [:player_name].include?(stat)}
      end
    end
  end
end

def big_shoe_rebounds
  biggest = 0 
  rebounds = 0 
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      size = player[:shoe]
      if size > biggest
        biggest = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  highest_scorer = ""
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      points = player[:points]
      if points > most_points
        most_points = points
        highest_scorer = player[:player_name]
      end
    end
  end
  highest_scorer
end

























