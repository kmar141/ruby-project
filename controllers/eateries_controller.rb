require_relative( '../models/eatery.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/deal.rb' )

require('pry-byebug')

get '/eateries' do
  @eateries = Eatery.all()
  @burgers = Burger.all()
  @deals = Deal.all()

  erb ( :"eateries/index" )
end

get '/eateries/new' do
  @eateries = Eatery.all
  @burgers = Burger.all
  @deals = Deal.all
  erb(:"eateries/new")
end

get '/eateries/:id' do
  @eatery = Eatery.find(params[:id])
  @burgers = @eatery.burgers
  @deals = @eatery.deals
  erb(:"eateries/id")
end

post '/eateries/:id' do
  @eateries = Eatery.find(params[:id])
  @eateries.update(params)
  redirect to "/eateries/#{params[:id]}"
end

get '/eateries/:id/edit' do 
  @eateries = Eatery.find(params[:id])
  erb(:"eateries/edit")
end

post '/eateries' do
  @eateries = Eatery.new(params)
  @eateries.save()
  redirect to "/eateries"
end