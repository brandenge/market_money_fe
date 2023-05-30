class MarketFacade
  def markets
    service.markets.map do |market_data|
      Market.new(market_data)
    end
  end

  def market(id)
    Market.new(service.market(id))
  end

  def search(name:, city:, state:)
    name = name.empty? ? nil : name
    city = city.empty? ? nil : city
    state = state.empty? ? nil : state
    markets_data = service.markets_search(name: name, city: city, state: state)
    markets_data.map do |market_data|
      Market.new(market_data)
    end
  end

  private

  def service
    @_service ||= MoneyMarketService.new
  end
end
