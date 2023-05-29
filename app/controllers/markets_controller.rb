class MarketsController < ApplicationController
  def index
    @markets = MarketFacade.new.markets
  end
end
