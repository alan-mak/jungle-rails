require 'rails_helper'

RSpec.feature "Visitor adds to shopping cart", type: :feature, js: true do

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

  scenario "Add to Cart" do
    # Visit the root path
    visit root_path
    # Capture Before Added
    save_screenshot "3a.png"
    # Click the add button
    find_button('Add', match: :first).click
    sleep(1)
    # Capture After Added
    save_screenshot "3b.png"
    # Cart should increase by one
    expect(page).to have_content("My Cart (1)")
  end
end