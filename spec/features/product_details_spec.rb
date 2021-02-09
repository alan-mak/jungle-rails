require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  describe "Should select products" do
        
    it "Should Visit the first link" do
      # ACT
      visit root_path
      # DEBUG / VERIFY
      save_screenshot('2a.png')
      # Clicks First Link
      click_link('Details', match: :first)
      # Takes a screenshot of a new page
      sleep(1)
      save_screenshot('2b.png')
      # Expect to see description
      page.has_content?('Description')
    end

    it "Should Visit the last link" do
      # ACT
      visit root_path
      save_screenshot('2c.png')
      # Clicks First Link
      click_link('Details', match: :first)
      # Takes a screenshot of a new page
      sleep(1)
      save_screenshot('2d.png')
      # Expect to see description
      page.has_content?('Description')
    end
  end
end