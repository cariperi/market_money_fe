require 'rails_helper'

RSpec.describe 'Farmers Market Service' do
  describe 'Establish Connection' do
    it 'can retrieve a list of markets' do
      markets = FarmersMarketService.new.get_markets

      expect(markets).to be_a(Hash)
      expect(markets[:data]).to be_an(Array)

      market = markets[:data].first

      expect(market).to have_key(:id)
      expect(market).to have_key(:type)
      expect(market).to have_key(:attributes)

      attributes = market[:attributes]
      expect(attributes).to have_key(:name)
      expect(attributes).to have_key(:street)
      expect(attributes).to have_key(:city)
      expect(attributes).to have_key(:county)
      expect(attributes).to have_key(:state)
      expect(attributes).to have_key(:zip)
      expect(attributes).to have_key(:lat)
      expect(attributes).to have_key(:lon)
      expect(attributes).to have_key(:vendor_count)
    end
  end
end