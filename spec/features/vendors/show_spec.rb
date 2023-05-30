require 'rails_helper'

RSpec.feature 'Vendor Show Page', vcr: { record: :new_episodes } do
  before do
    vendor_id = 55297
    @vendor = VendorFacade.new.vendor(vendor_id)
    visit vendor_path(vendor_id)
  end

  it 'has headers' do
    expect(page).to have_content('Contact Info:')
    expect(page).to have_content('Credit Accepted?:')
    expect(page).to have_content('Description:')
  end

  it "shows the vendor's information" do
    expect(page).to have_content(@vendor.name)
    expect(page).to have_content(@vendor.description)
    expect(page).to have_content(@vendor.contact_name)
    expect(page).to have_content(@vendor.contact_phone)
    expect(page).to have_content(@vendor.credit_accepted ? 'YES' : 'NO')
  end

  it 'can search for markets to add the vendor to' do
    expect(page).to have_content('Search for Markets to add this vendor:')

    expect(page).to have_field('name', type: 'text')
    expect(page).to have_field('city', type: 'text')
    expect(page).to have_field('state', type: 'text')
    expect(page).to have_button('Search')
  end
end
