class MarketsFacade
  def self.get_markets
    data = FarmersMarketService.new.get_markets
    markets = data[:data]

    markets.map do |market|
      Market.new(clean_data(market))
    end
  end

  def self.clean_data(data)
    attributes = data[:attributes]
    {
      id: data[:id],
      name: attributes[:name],
      street: attributes[:street],
      city: attributes[:city],
      county: attributes[:county],
      state: attributes[:state],
      zip: attributes[:zip],
      lat: attributes[:lat],
      lon: attributes[:lon]
    }
  end
end