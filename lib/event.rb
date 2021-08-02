require 'date'

class Event
  attr_reader :name, :date, :food_trucks

  def initialize(name)
    @name = name
    @date = Date.today.to_s #idk how to use dates
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    all_inventory = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |key_item, value_stock|
        all_inventory[key_item] ||= {quantity: 0, food_trucks: []}
        all_inventory[key_item][:quantity] += value_stock
        all_inventory[key_item][:food_trucks] << food_truck
      end
    end
    all_inventory
  end

  def overstocked_items
    total_inventory.filter_map do |key_item, value_quantity_food_trucks|
      if value_quantity_food_trucks[:quantity] > 50 && value_quantity_food_trucks[:food_trucks].size > 1
        key_item
      end
    end
  end

  def sorted_item_list
    total_inventory.map do |key_item, value_quantity_food_trucks|
      key_item.name
    end.sort
  end

  def sell(item, amount)
    if total_inventory[item].nil? || total_inventory[item][:quantity] < amount
      false
    else
      # something something with @foodtrucks here
      true
    end
  end
end