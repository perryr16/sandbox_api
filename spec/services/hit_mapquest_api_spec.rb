require 'rails_helper'

describe "hitting mapquest" do

  it "return direction info" do
    map_service = MapquestService.new
 
    to_address = "Denver%20,CO"
    from_address = "Boulder%20,CO"
    directions = map_service.get_directions(to_address, from_address)

    results = MapquestResults.new(to_address, from_address)
    narratives = results.narrative
    time_to_destination = results.time_to_destination
 
  end
  
  
end
