require 'rails_helper'

describe "hit game api" do 

  xit "returns game for given keywords" do
    service = GameService.new
    mk64 = service.get_games_by_name('Mario Kart 64')
    mk64_video_id = service.get_game_videos(mk64[0][:videos][0])

    mk64_all_keyids = mk64[0][:keywords]
    mk64_keyids = mk64_all_keyids[0..10]

    results = GameResults.new
    # keywords = ['mario', 'snaking']
    # ids = results.generate_ids(mk64_keywords)
    # found_games = results.find_games_with_keywords(mk64_keywords) 
    found_games = results.find_games_with_keyids(mk64_keyids) 

    found_games.each do |game|
      puts game[:name]
      mk64_keyids.each do |id|
        expect(game[:keywords].include?(id)).to eq(true)
      end
    end
  end
  
  
end

# new_game = service.get_games_by_keyword(mk64_keywords)
# new_game_name = new_game[0][:name]