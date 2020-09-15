require './lib/item'

class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[:item]
  end

  def stock(item, number)
    @inventory[item] += number
  end

  def potential_revenue
    revenue = @inventory.map do |item|
      item[:item].price * item[:item]
    end.sum
  end

end
