require 'rails_helper'

RSpec.describe Market do
  before(:each) do
    @data = {
      id: '1',
      type: 'market',
      name: 'Test Market',
      street: '123 Test Street',
      city: 'Test City',
      state: 'Test State',
      county: 'Test County',
      zip: '12345',
      lat: '1.0',
      lon: '1.0'
    }
  end

  it 'exists and has attributes' do
    market = Market.new(@data)

    expect(market).to be_a(Market)
    expect(market.id).to eq('1')
    expect(market.name).to eq('Test Market')
  end

  it '#format_address can format the address' do
    market = Market.new(@data)

    expect(market.format_address).to eq('Test City, Test State 12345')
  end
end