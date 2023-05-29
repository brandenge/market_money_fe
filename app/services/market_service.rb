class MarketService
  API_DOMAIN = 'http://localhost:3000/api/v0'.freeze

  def markets
    url = "#{API_DOMAIN}/markets"
    get_url(url)[:data]
  end

  def market(id)
    market_url = "#{API_DOMAIN}/markets/#{id}"
    market = get_url(market_url)[:data]
    market_vendors_url = "#{API_DOMAIN}/markets/#{id}/vendors"
    market[:vendors] = get_url(market_vendors_url)[:data]
    market
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: API_DOMAIN,
      headers: { 'Content-Type' => 'application/json' })
  end
end
