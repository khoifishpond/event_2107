require './lib/food_truck'
require './lib/item'
require 'rspec'

describe FoodTruck do
  context 'Attributes' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    it 'exists' do
      expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'starts with no inventory' do
      expect(food_truck.inventory).to eq({})
    end
  end

  context 'Behaviors' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: "Peach Pie (Slice)", price: "$3.75"})
    item2 = Item.new({name: "Apple Pie (Slice)", price: "$2.50"})

    it 'can check the stock of an item' do
      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'can stock item' do
      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      expect(food_truck.check_stock(item1)).to eq(30)

      food_truck.stock(item1, 25)

      expect(food_truck.check_stock(item1)).to eq(55)

      food_truck.stock(item2, 12)

      expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
    end

    it 'can calculate potential revenue of its inventory' do
      expect(food_truck.potential_revenue).to eq(236.25)
    end
  end
end