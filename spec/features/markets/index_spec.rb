require 'rails_helper'

RSpec.describe 'Markets Index Page', type: :feature do
  before(:each) do
    @markets = MarketsFacade.get_markets
  end

  describe 'User Story 1' do
    describe 'As a visitor, when I visit /markets' do
      it 'I see all markets listed with their name, city and state' do
        visit markets_path

        expect(page).to have_content("All Markets")

        market = @markets.first

        expect(page).to have_content(market.name) unless market.name.nil?
        expect(page).to have_content(market.city) unless market.city.nil?
        expect(page).to have_content(market.state) unless market.state.nil?
        expect(page).to have_content("More Info")
      end

      it 'When I click a button to see more info, I am taken to that markets show page' do
        visit markets_path

        market = @markets.first

        find(".market", match: :first).click_on "More Info"
        expect(current_path).to eq(market_path(market.id))
      end
    end
  end
end