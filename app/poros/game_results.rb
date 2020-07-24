class GameResults
  
  def service 
    GameService.new
  end


  def generate_ids(words)
    ids = words.map do |word|
      service.get_keyword(word)[0][:id]
    end
  end

  def find_games_with_keywords(words)
    ids = generate_ids(words)
    games = service.get_games_by_keywords(ids)
  end
    
  def find_games_with_keyids(ids)
    games = service.get_games_by_keywords(ids)
  end
    

end