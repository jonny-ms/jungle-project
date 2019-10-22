require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

    scenario "Visitor sees all product details when clicking on a product's details button" do
      # ACT
      visit root_path
      first('a.btn').click
      page.find(".products-show")
      
      # DEBUG
      save_screenshot
  
      # VERIFY
      expect(page).to have_css ".products-show"
    end

end
