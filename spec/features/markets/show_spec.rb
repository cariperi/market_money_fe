require 'rails_helper'

RSpec.describe 'Market Show Page' do
  describe "As a visitor when I visit a specific market show page ('markets/:id')" do
    it 'I see that markets name and a readable address' do
      visit market_path(322458)

      expect(page).to have_content("14&U Farmers' Market")
      expect(page).to have_content("1400 U Street NW")
      expect(page).to have_content("Washington, District of Columbia 20009")
    end

    it 'I also see a list of all vendors at that market and each vendor name is a link to the vendor show page' do
      visit market_path(322458)

      expect(page).to have_content("Vendors at our Market:")
      expect(page).to have_content("The Charcuterie Corner")

      click_on "The Charcuterie Corner"
      expect(current_path).to eq(vendor_path(55823))
    end
  end
end
