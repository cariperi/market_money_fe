class FarmersMarketService
  def get_markets
    get_url('api/v0/markets')
  end

  def conn
    Faraday.new(url: 'http://localhost:3000') do |f|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end