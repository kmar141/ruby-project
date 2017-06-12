require_relative( '../models/deal.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/burger.rb')
require('pry-byebug')

eatery1 = Eatery.new({
  'name' => "Lucys"
  })

eatery2 = Eatery.new({
  'name' => "Spoons"
  })
eatery1.save()
eatery2.save()

burger1 = Burger.new({
  'name' => "Cheeseburger",
  'eatery_id' => eatery1.id
  })
burger2 = Burger.new({
  'name' => "Chickenburger",
  'eatery_id' => eatery1.id
  })
burger1.save()
burger2.save()

deal1 = Deal.new({
  'name' => "Two for Tuesday",
  'day' => "Tuesday",
  'eatery_id' => eatery1.id
  })
deal2 = Deal.new({
  'name' => "Buy one get one free",
  'day' => "Monday",
  'eatery_id' => eatery2.id
  })

deal1.save()
deal2.save()

