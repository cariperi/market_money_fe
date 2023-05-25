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

    it 'can retrieve a list of vendors for a given market' do
      vendors = FarmersMarketService.new.get_vendors_for_market(322458)

      expect(vendors).to be_a(Hash)
      expect(vendors[:data]).to be_an(Array)

      vendor = vendors[:data].first

      expect(vendor).to have_key(:id)
      expect(vendor).to have_key(:type)
      expect(vendor).to have_key(:attributes)

      attributes = vendor[:attributes]

      keys = [:name, :description, :contact_name, :contact_phone]
      keys.each do |key|
        expect(attributes).to have_key(key)
        expect(attributes[key]).to be_a(String)
      end

      expect(attributes).to have_key(:credit_accepted)
      expect(attributes[:credit_accepted]).to be_in([true, false])
    end

    it 'can retrieve a single vendor' do
      vendor = FarmersMarketService.new.get_vendor(55823)

      expect(vendor).to be_a(Hash)
      expect(vendor[:data]).to be_a(Hash)

      vendor = vendor[:data]

      expect(vendor).to have_key(:id)
      expect(vendor).to have_key(:type)
      expect(vendor).to have_key(:attributes)

      attributes = vendor[:attributes]

      keys = [:name, :description, :contact_name, :contact_phone]
      keys.each do |key|
        expect(attributes).to have_key(key)
        expect(attributes[key]).to be_a(String)
      end

      expect(attributes).to have_key(:credit_accepted)
      expect(attributes[:credit_accepted]).to be_in([true, false])
    end
  end
end