require './lib/item'
require './lib/food_truck'
require 'minitest/autorun'
require 'minitest/pride'

class FoodTruckTest < Minitest::Test

  def test_it_exists_and_has_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
    assert_equal "Rocky Mountain Pies", food_truck.name
    assert_equal ({}), food_truck.inventory
  end

  def test_check_stock
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    assert_equal 0, food_truck.check_stock(item1)
  end
end
