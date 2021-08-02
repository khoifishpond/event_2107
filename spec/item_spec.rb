require './lib/item'
require 'rspec'

describe Item do
  context 'Attributes' do
    item1 = Item.new({name: "Peach Pie (Slice)", price: "$3.75"})
    item2 = Item.new({name: "Apple Pie (Slice)", price: "$2.50"})

    it 'exists' do
      expect(item1).to be_a(Item)
    end

    it 'has a name' do
      expect(item1.name).to eq("Peach Pie (Slice)")
    end

    it 'has a price' do
      expect(item2.price).to eq(2.50)
    end
  end
end