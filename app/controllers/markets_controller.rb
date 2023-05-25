class MarketsController < ApplicationController
  def index
    @markets = MarketsFacade.get_markets
  end

  def show
    # @market = MarketsFacade.get_market_details(params[:id])
  end
end