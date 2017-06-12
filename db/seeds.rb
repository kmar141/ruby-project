require_relative( '../models/deal.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/burger.rb')
require('pry-byebug')

burger1 = Burger.new({
  'name' => "Cheeseburger"
  })
burger2 = Burger.new({
  'name' => "Chickenburger"
  })

deal1 = Deal.new({
  'name' => "Two for Tuesday",
  'day' => "Tuesday"
  })

eatery1 = Eatery.new({
  'name' => "Lucys",
  'burger_id' => burger1.id,
  'deal_id' => deal1.id
  })

burger1.save()
burger2.save()
deal1.save()

