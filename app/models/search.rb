class Search
  def initialize(word)
    @search_service = OxfordService.new
    @word = word
  end

  def word_roots
    raw_stations = @search_service.get_url("/api/v1/inflections/en/#{@word}")
    require 'pry'; binding.pry
    stations = raw_stations[:fuel_stations].map do |station|
      Station.new(station[:station_name],station[:street_address],station[:fuel_type_code],station[:distance],station[:access_days_time])
    end
    stations.sort_by(&:distance)
  end

end
