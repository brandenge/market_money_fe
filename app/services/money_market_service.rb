class MoneyMarketService
  API_DOMAIN = 'http://localhost:3000/api/v0'.freeze

  def markets
    url = "#{API_DOMAIN}/markets"
    get_url(url)[:data].map do |market_data|
      market_hash(market_data)
    end
  end

  def market(id)
    market_url = "#{API_DOMAIN}/markets/#{id}"
    market_data = get_url(market_url)[:data]

    market_vendors_url = "#{API_DOMAIN}/markets/#{id}/vendors"
    market_vendors_data = get_url(market_vendors_url)[:data]

    market = market_hash(market_data)
    market[:vendors] = market_vendors_data.map do |market_vendor|
      vendor_hash(market_vendor)
    end
    market
  end

  private

  def market_hash(market_data)
    {
      id: market_data[:id],
      name: market_data[:attributes][:name],
      street: market_data[:attributes][:street],
      city: market_data[:attributes][:city],
      county: market_data[:attributes][:county],
      state: market_data[:attributes][:state],
      zip: market_data[:attributes][:zip],
      lat: market_data[:attributes][:lat],
      lon: market_data[:attributes][:lon]
    }
  end

  def vendor_hash(vendor_data)
    {
      id: vendor_data[:id],
      name: vendor_data[:attributes][:name],
      description: vendor_data[:attributes][:description],
      contact_name: vendor_data[:attributes][:contact_name],
      contact_phone: vendor_data[:attributes][:contact_phone],
      credit_accepted: vendor_data[:attributes][:credit_accepted]
    }
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: API_DOMAIN,
      headers: { 'Content-Type' => 'application/json' })
  end
end
