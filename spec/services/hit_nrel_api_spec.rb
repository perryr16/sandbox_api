require 'rails_helper'

describe "hitting NREL" do

  it "return direction info" do
    nrel_service = NrelService.new
    city = "Denver"
    state_abbr = "CO"
    zip = "80209"
    street = "405+South+Pearl+Street"
    address = street+"+"+city+"+"+state_abbr
    address_denver = city+"+"+state_abbr

    energy_denver = nrel_service.get_energy_cohort_data(city, state_abbr, zip)
    fuel_stations_near_denver = nrel_service.get_fuel_stations_near(address)

    nrel_results = NrelResults.new 

    address_of_fuel_station_near_me = nrel_results.address_of_fuel_station_near(address)
    address_of_fuel_station_near_denver = nrel_results.address_of_fuel_station_near(address_denver)
    binding.pry
  end
  
  
end
