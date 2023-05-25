class FarmersMarketFacade
  def get_markets
    data = service.get_markets
    markets = data[:data]

    markets.map do |market|
      Market.new(clean_market_data(market))
    end
  end

  def get_market(id)
    data = service.get_market(id)
    market = data[:data]

    Market.new(clean_market_data(market))
  end

  def get_vendors_for_market(id)
    data = service.get_vendors_for_market(id)
    vendors = data[:data]

    vendors.map do |vendor|
      Vendor.new(clean_vendor_data(vendor))
    end
  end

  def get_vendor(id)
    data = service.get_vendor(id)
    vendor = data[:data]

    Vendor.new(clean_vendor_data(vendor))
  end

  private

  def service
    @_service ||= FarmersMarketService.new
  end

  def clean_market_data(data)
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

  def clean_vendor_data(data)
    attributes = data[:attributes]
    {
      id: data[:id],
      name: attributes[:name],
      description: attributes[:description],
      contact_name: attributes[:contact_name],
      contact_phone: attributes[:contact_phone],
      credit_accepted: attributes[:credit_accepted]
    }
  end
end