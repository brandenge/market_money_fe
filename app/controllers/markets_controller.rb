class MarketsController < ApplicationController
  def index
    @markets = MarketFacade.new.markets
  end

  def show
    @market = MarketFacade.new.market(params[:id])
  end

  def search
    @markets = MarketFacade.new.search(
      name: params[:name],
      city: params[:city],
      state: params[:state]
    )
  end
end
