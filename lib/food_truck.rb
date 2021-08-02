class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    inventory[item] ||= 0
  end

  def stock(item, quantity)
    @inventory[item] ||= 0
    @inventory[item] += quantity
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |key_item, value_stock|
      revenue += key_item.price * value_stock
    end
    revenue
  end
end