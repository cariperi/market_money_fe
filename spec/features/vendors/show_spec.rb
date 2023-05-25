require 'rails_helper'

RSpec.describe 'Vendor Show Page', type: :feature do
  describe 'User Story 3' do
    describe 'As a visitor when I visit the vendors show page (vendors/:id)' do
      it 'I see the vendor name, contact info, whether they accept credit cards, and a description of what they sell' do
        vendor = FarmersMarketFacade.new.get_vendor(55823)
        expected_value = vendor.credit_accepted ? "YES" : "NO"

        visit vendor_path(55823)

        expect(page).to have_content(vendor.name)
        expect(page).to have_content("Contact Info:")
        expect(page).to have_content("Name: #{vendor.contact_name}")
        expect(page).to have_content("Phone: #{vendor.contact_phone}")
        expect(page).to have_content("Credit Accepted? #{expected_value}")
        expect(page).to have_content("Description: #{vendor.description}")
      end
    end
  end
end
