require_relative( '../models/eatery.rb' )

get '/eateries' do
  @eateries = Eatery.all()
  erb ( :"eateries/index" )
end

get '/eateries/new' do
  @eateries = Eatery.all
  erb(:"eateries/new")
end

get '/eateries/:id' do
  @eateries = Eatery.find(params[:id])
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
  erb(:"eateries/new")
end