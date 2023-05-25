RSpec.describe Vendor do
  it 'has attributes' do
    data = {
      id: '1',
      type: 'vendor',
      name: 'Test Vendor',
      description: 'Test Description',
      contact_name: 'Test Name',
      contact_phone: '123-456-7890',
      credit_accepted: true
    }

    vendor = Vendor.new(data)

    expect(vendor.id).to eq('1')
    expect(vendor.name).to eq('Test Vendor')
  end
end