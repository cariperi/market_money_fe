class VendorsController < ApplicationController
  def show
    @vendor = FarmersMarketFacade.new.get_vendor(params[:id])
  end
end