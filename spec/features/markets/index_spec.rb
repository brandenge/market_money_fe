require 'rails_helper'

RSpec.feature 'Markets Index Page' do
  before do
    visit markets_path
  end

  it 'has a header' do
    expect(page).to have_content('Markets')
  end

  within '#index' do
    expect(page).to have_css('.market', count: 20)
    within(first('.market')) do
      within('.name') do
        expect(page).to have_content("14&U Farmers' Market")
      end
      within('.city') do
        expect(page).to have_content('Washington')
      end
      within('.state') do
        expect(page).to have_content('District of Columbia')
      end
      within('.more_info') do
        expect(page).to have_button('More Info')
      end
    end
  end
end
