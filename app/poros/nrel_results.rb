class NrelResults 

  def service 
    NrelService.new
  end

  def address_of_fuel_station_near(address)
    response = service.get_fuel_stations_near(address)
    response[:fuel_stations][0][:intersection_directions]
  end

  
end