require 'rails_helper'

RSpec.describe Vendor do
  before(:each) do
    @data = {
      id: '1',
      type: 'vendor',
      name: 'Test Vendor',
      description: 'Test Description',
      contact_name: 'Test Name',
      contact_phone: '123-456-7890',
      credit_accepted: true
    }
  end

  it 'has attributes' do
    vendor = Vendor.new(@data)

    expect(vendor.id).to eq('1')
    expect(vendor.name).to eq('Test Vendor')
  end

  it '#is_credit_accepted can print yes or no' do
    vendor = Vendor.new(@data)

    expect(vendor.is_credit_accepted).to eq('YES')
  end
end