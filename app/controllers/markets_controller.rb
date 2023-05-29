class MarketsController < ApplicationController
  def index
    @markets = MarketFacade.new.markets
  end

  def show
    @market = MarketFacade.new.market(params[:id])
  end
end
