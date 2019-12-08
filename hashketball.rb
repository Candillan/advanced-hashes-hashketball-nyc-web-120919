# Write your code here!
def game_hash
  hash = {
    away: { team_name: "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            players: [
              { player_name: "Jeff Adrien",
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: "Bismack Biyombo",
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: "DeSagna Diop",
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: "Ben Gordon",
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: "Kemba Walker",
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: "Brooklyn Nets",
            :colors => ["Black", "White"],
            players: [
              { player_name: "Alan Anderson",
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: "Reggie Evans",
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: "Brook Lopez",
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: "Mason Plumlee",
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: "Jason Terry",
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end

#some of my ennumerables were acting a tad wonky after I hit submit. I replaced a few with the solution until I can get them working personally again.

def num_points_scored(sought_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players

      data.each do |player|
        return player[:points] if player[:player_name] == sought_player_name
      end
    end
  end
end

def shoe_size(sought_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players

      data.each do |player|
        return player[:shoe] if player[:player_name] == sought_player_name
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    return game_hash[place][:colors] if team[:team_name] == team_name
  end
end

def team_names
  game_hash.collect do |_place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |_place, team|
    next unless team[:team_name] == team_name

    team.each do |attribute, data|
      next unless attribute == :players

      data.each do |data|
        nums << data[:number]
      end
    end
  end
  nums
end

def player_stats(sought_player_name)
  new_hash = {}
  game_hash.collect do |place, team|
    team.each do |attribute, _data|
      next unless attribute == :players

      game_hash[place][attribute].each do |player|
        next unless player[:player_name] == sought_player_name

        new_hash = player.delete_if do |k, _v|
          k == :player_name
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0

  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        num_rebounds = player[:rebounds]
      end
    end
  end

  num_rebounds
end
