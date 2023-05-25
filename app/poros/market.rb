class Market
  attr_reader :name,
              :street,
              :city,
              :county,
              :state,
              :zip,
              :lat,
              :lon,
              :id

  def initialize(data)
    @name = data[:name]
    @street = data[:street]
    @city = data[:city]
    @county = data[:county]
    @state = data[:state]
    @zip = data[:zip]
    @lat = data[:lat]
    @lon = data[:lon]
    @id = data[:id]
  end
end