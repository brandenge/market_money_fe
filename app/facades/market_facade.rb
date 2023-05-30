class MarketFacade
  def markets
    service.markets.map do |market_data|
      Market.new(market_data)
    end
  end

  def market(id)
    Market.new(service.market(id))
  end

  def search(name: nil, city: nil, state: nil)
    
  end

  private

  def service
    @_service ||= MoneyMarketService.new
  end
end
