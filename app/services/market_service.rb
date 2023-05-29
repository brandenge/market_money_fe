class MarketService
  API_DOMAIN = 'http://localhost:3000/api/v0'.freeze

  def markets
    url = "#{API_DOMAIN}/markets"
    get_url(url)[:data]
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
