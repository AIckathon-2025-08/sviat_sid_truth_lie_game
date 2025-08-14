class GameStore
  @@active_games = {}
  
  def self.create_game(attributes)
    game = GameSession.new(attributes)
    @@active_games[game.token] = game
    game
  end
  
  def self.find_game(token)
    @@active_games[token]
  end
  
  def self.all_games
    @@active_games.values
  end
  
  def self.delete_game(token)
    @@active_games.delete(token)
  end
  
  def self.cleanup_old_games
    cutoff_time = 24.hours.ago
    @@active_games.delete_if { |_, game| game.created_at < cutoff_time }
  end
  
  # For development/testing - clear all games
  def self.clear_all
    @@active_games.clear
  end
end
