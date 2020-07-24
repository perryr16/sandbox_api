class MapquestService 

  def conn 
    Faraday.new("https://www.mapquestapi.com/") do |res|
      res.params[:key] = ENV['MAPQUEST_KEY']
    end
  end

# Denver%2C+CO
# Boulder%2C+CO
  def get_directions(to_address, from_address)
    response = conn.get("directions/v2/route") do |res|
      res.params[:to] = to_address
      res.params[:from] = from_address
      res.params[:outFormat] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_directions_2
    response = conn.get("directions/v2/route?key=bW5J6NVA1gT64FrRBRViGqTYVcfkUq7F&from=Denver%2C+CO&to=Boulder%2C+CO&outFormat=json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn2 
    res = Faraday.new("https://www.mapquestapi.com/directions/v2/route?key=bW5J6NVA1gT64FrRBRViGqTYVcfkUq7F&from=Denver%2C+CO&to=Boulder%2C+CO&outFormat=json")
    JSON.parse(res.body, symbolize_names: true)
  end
  
end