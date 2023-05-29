class MarketFacade
  def markets
    service.markets.map do |market_data|
      Market.new(market_data)
    end
  end

  private

  def service
    @_service ||= MarketService.new
  end
end
