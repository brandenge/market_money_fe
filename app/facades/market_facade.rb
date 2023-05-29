class MarketFacade
  def markets
    service.markets.map do |market_data|
      Market.new(market_data)
    end
  end

  def market(id)
    Market.new(service.market(id))
  end

  private

  def service
    @_service ||= MarketService.new
  end
end
