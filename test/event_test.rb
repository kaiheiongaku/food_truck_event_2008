require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'minitest/autorun'
require 'minitest/pride'

class EventTest < Minitest::Test

  def test_it_exists_and_has_attributes
    event = Event.new("South Pearl Street Farmers Market")

    assert_instance_of Event, event
    assert_equal "South Pearl Street Farmers Market", event.name
    assert_equal [], event.food_trucks

    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    assert_equal [food_truck1, food_truck2, food_truck3], event.food_trucks

    expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, event.food_truck_names
  end

  def test_food_trucks_that_sell(item)
    event = Event.new("South Pearl Street Farmers Market")

    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    assert_equal [food_truck1, food_truck3], event.food_trucks_that_sell(item1)
    assert_equal [food_truck2], event.food_trucks_that_sell(item4)
  end

  def test_potential_revenue

    event = Event.new("South Pearl Street Farmers Market")

    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expected = ({
        #<Item:0x007f9c56740d48...> => {
          quantity: 100,
          food_trucks: [#<FoodTruck:0x00007fe1348a1160...>, #<FoodTruck:0x00007fe134910650...>]
        },
        #<Item:0x007f9c565c0ce8...> => {
          quantity: 7,
          food_trucks: [#<FoodTruck:0x00007fe1348a1160...>]
        },
        #<Item:0x007f9c56343038...> => {
          quantity: 50,
          food_trucks: [#<FoodTruck:0x00007fe1349bed40...>]
        },
        #<Item:0x007f9c562a5f18...> => {
          quantity: 35,
          food_trucks: [#<FoodTruck:0x00007fe1349bed40...>, #<FoodTruck:0x00007fe134910650...>]
        },
      })

    assert_equal expected, event.total_inventory
  end




end
