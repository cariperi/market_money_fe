class MarketsController < ApplicationController
  def index
    @markets = FarmersMarketFacade.new.get_markets
  end

  def show
    @market = FarmersMarketFacade.new.get_market(params[:id])
    @vendors = FarmersMarketFacade.new.get_vendors_for_market(params[:id])
  end
end