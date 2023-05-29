require 'rails_helper'

RSpec.feature 'Market Show Page', :vcr do
  before do
    @market = create(:market)
    visit market_path(@market)
  end

  it 'has headers' do
    expect(page).to have_content(@market.name)
    expect(page).to have_content(@market.street)
    expect(page).to have_content(@market.city)
    expect(page).to have_content(@market.state)
    expect(page).to have_content(@market.zip)
    expect(page).to have_content('Vendors at our Market:')
  end

  it 'shows all of the vendors for the market' do
    within '#vendors' do
      expect(page).to have_css('.vendor', count: 5)

      @markets.vendors.each do |vendor|
        expect(page).to have_link(vendor.name)
      end
    end
  end
end
