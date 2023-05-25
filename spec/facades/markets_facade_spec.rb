require 'rails_helper'

RSpec.describe 'Markets Facade' do
  describe 'class methods' do
    it 'can create an array of Market objects' do
      markets = MarketsFacade.get_markets

      expect(markets).to be_an(Array)

      markets.each do |market|
        expect(market).to be_a(Market)
      end
    end
  end
end