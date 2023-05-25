require 'rails_helper'

RSpec.describe 'Markets Facade' do
  describe 'class methods' do
    describe 'get_markets' do
      it 'can create an array of Market objects' do
        markets = MarketsFacade.new.get_markets

        expect(markets).to be_an(Array)

        markets.each do |market|
          expect(market).to be_a(Market)
        end
      end
    end

    describe 'get_market(id)' do
      it 'can create one Market object' do
        market = MarketsFacade.new.get_market(322458)

        expect(market).to be_a(Market)
      end
    end
  end
end