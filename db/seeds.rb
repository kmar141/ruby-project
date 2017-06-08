require_relative( '../models/deal.rb' )
require_relative( '../models/eatery.rb' )
require('pry-byebug')

Burger.delete_all()
Eatery.delete_all()
Deal.delete_all()

burger1 = Burger.new({
  'name' => "Cheeseburger"
  })

eatery1 = Eatery.new({
  'name' => "Lucy's",
  'burger_id' => burger1.id,
  'deal_id' => deal1.id
  })

deal1 = Deal.new({
  'name' => "Two for Tuesday",
  'day' => "Tuesday"
  })

burger1.save()