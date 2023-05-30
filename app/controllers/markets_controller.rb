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
    redirect_to vendor_path(params[:vendor_id])
  end
end
