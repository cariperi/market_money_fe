require 'rails_helper'

RSpec.describe 'Markets Facade' do
  describe 'instance methods' do
    describe 'get_markets' do
      it 'can create an array of Market objects' do
        markets = FarmersMarketFacade.new.get_markets

        expect(markets).to be_an(Array)

        markets.each do |market|
          expect(market).to be_a(Market)
        end
      end
    end

    describe 'get_market(id)' do
      it 'can create one Market object' do
        market = FarmersMarketFacade.new.get_market(322458)

        expect(market).to be_a(Market)
      end
    end

    describe 'get_vendors_for_marekt(id)' do
      it 'can create Vendor objects' do
        vendors = FarmersMarketFacade.new.get_vendors_for_market(322458)

        expect(vendors).to be_an(Array)

        vendors.each do |vendor|
          expect(vendor).to be_a(Vendor)
        end
      end
    end

    describe 'get_vendor(id)' do
      it 'can create one Vendor object' do
        vendor = FarmersMarketFacade.new.get_vendor(55823)

        expect(vendor).to be_a(Vendor)
      end
    end
  end
end