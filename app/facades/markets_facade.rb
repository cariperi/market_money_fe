class MarketsFacade
  def get_markets
    data = service.get_markets
    markets = data[:data]

    markets.map do |market|
      Market.new(clean_data(market))
    end
  end

  def get_market(id)
    data = service.get_market(id)
    market = data[:data]

    Market.new(clean_data(market))
  end

  def clean_data(data)
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

  private

  def service
    @_service ||= FarmersMarketService.new
  end
end