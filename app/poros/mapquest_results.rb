class MapquestResults

  def initialize(to_address, from_address) 
    @to_address = to_address
    @from_address = from_address
  end

  def service 
    MapquestService.new.get_directions(@to_address, @from_address)
  end

  def narrative
    narrative = [service[:route][:legs][0][:origNarrative]]
    narrative << service[:route][:legs][0][:maneuvers].map {|element| element[:narrative]}
    narrative.join(", \n then ")
  end

  def time_to_destination
    ((service[:route][:time]/60.0).to_i.to_s)+ " minutes"
  end

  # def miles_to_destination
  #   binding.pry
  #   ((service[:route][:time]/60.0).to_i.to_s)+ " minutes"
  # end
  
end