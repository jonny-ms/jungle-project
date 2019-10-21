require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully if name, price, quantity, and category are set' do
      @category = Category.find_or_create_by! name: 'Grooming'
      
      @product = @category.products.create!({
        name: 'Toothpick',
        price: 100,
        quantity: 42
      })

      expect(@product).to be_valid
      expect(@product.errors.full_messages).to_not be_present
    end
    
    it 'should not validate without name' do

      @category = Category.find_or_create_by! name: 'Sports'

      @product = @category.products.create({
        name: nil,
        price: 1000,
        quantity: 42
      })

      expect(@product).to_not be_valid 
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'should not validate without price' do

      @category = Category.find_or_create_by! name: 'Costumes'

      @product = @category.products.create({
        name: 'Aladdin',
        price: nil,
        quantity: 42
      })
  
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'should not validate without quantity' do

      @category = Category.find_or_create_by! name: 'Music'

      @product = @category.products.create({
        name: 'Guitar',
        price: 6500,
        quantity: nil
      })

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not validate without category' do
  

      @product = Product.create({
        name: 'Turtle',
        price: 10000,
        quantity: 42
      })

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end 
end