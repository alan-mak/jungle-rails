require "rails_helper"
require "spec_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => 'Clothing')
      @product = Product.new(:name => 'Shoe', :price => 300, :quantity => 1, :category => @category)
    end
    
    it "Should save the product" do
      expect(@product).to be_valid
    end

    it "Should validate the name" do
    # validation tests/examples here
      expect(@product.name).to eq('Shoe')
      expect(@product.name).not_to be_nil
      category = Category.new(:name => 'Clothing')
      product = Product.new(:name => nil, :price => 300, :quantity => 1, :category => category)
      expect(product).to be_invalid
    end

    it "Should validate the price" do
      expect(@product.price).to eq(300)
      expect(@product.price).not_to be_nil
      category = Category.new(:name => 'Clothing')
      product = Product.new(:name => "Shoe", :price => nil, :quantity => 1, :category => category)
      expect(product).to be_invalid
    end

    it "Should validate the quantity" do
      expect(@product.quantity).to eq(1)
      @product.invalid?
      expect(@product.quantity).not_to be_nil
      category = Category.new(:name => 'Clothing')
      product = Product.new(:name => "Shoe", :price => 300, :quantity => nil, :category => category)
      expect(product).to be_invalid
    end

    it "Should validate the category" do
      expect(@category.name).to eq("Clothing")
      expect(@product.category).to eq(@category)
      expect(@product.category).not_to be_nil
      product = Product.new(:name => "Shoe", :price => 300, :quantity => 1, :category => nil)
      expect(product).to be_invalid
    end
  end
end