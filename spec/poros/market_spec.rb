require 'rails_helper'

RSpec.describe Market do
  it 'has attributes' do
    data = {
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

    market = Market.new(data)

    expect(market.id).to eq('1')
    expect(market.name).to eq('Test Market')
  end
end