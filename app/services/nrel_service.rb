class NrelService

  def conn
    Faraday.new("https://developer.nrel.gov/api/") do |res|
      res.params[:api_key] = ENV['NREL_KEY']
      res.headers[:accept] = 'application/json'
    end
  end

  def get_energy_cohort_data(city, state_abbr, zip)
    response = conn.get("cleap/v1/energy_cohort_data") do |res|
      res.params[:city] = city
      res.params[:state_abbr] = state_abbr
      res.params[:zip] = zip
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_fuel_stations_near(address)
    response = conn.get("alt-fuel-stations/v1/nearest") do |res|
      res.params[:format] = 'json'
      res.params[:location] = address
    end
    JSON.parse(response.body, symbolize_names: true)

  end

end