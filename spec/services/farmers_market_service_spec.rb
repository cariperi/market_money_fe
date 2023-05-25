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

      keys = [:name, :street, :city, :county, :state, :zip, :lat, :lon]
      keys.each do |key|
        expect(attributes).to have_key(key)
        expect(attributes[key]).to be_a(String)
      end

      expect(attributes).to have_key(:vendor_count)
      expect(attributes[:vendor_count]).to be_an(Integer)
    end

    it 'can retrieve one market' do
      market = FarmersMarketService.new.get_market(322458)

      expect(market).to be_a(Hash)
      expect(market[:data]).to be_a(Hash)

      market = market[:data]

      expect(market).to have_key(:id)
      expect(market).to have_key(:type)
      expect(market).to have_key(:attributes)

      attributes = market[:attributes]

      keys = [:name, :street, :city, :county, :state, :zip, :lat, :lon]
      keys.each do |key|
        expect(attributes).to have_key(key)
        expect(attributes[key]).to be_a(String)
      end

      expect(attributes).to have_key(:vendor_count)
      expect(attributes[:vendor_count]).to be_an(Integer)
    end
  end
end