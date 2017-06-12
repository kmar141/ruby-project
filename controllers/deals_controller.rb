require_relative( '../models/deal.rb' )

get '/deals' do
  @deals = Deal.all()
  erb ( :"deals/index" )
end

get '/deals/new' do
  @deals = Deal.all
  @eateries = Eatery.all()
  erb(:"deals/new")
end

get '/deals/:id' do
  @deals = Deal.find(params[:id])
  erb(:"deals/id")
end

post '/deals/:id' do
  @deals = Deal.find(params[:id])
  @deals.update(params)
  redirect to "/deals/#{params[:id]}"
end

get '/deals/:id/edit' do 
  @deals = Deal.find(params[:id])
  erb(:"deals/edit")
end

post '/deals' do
  @deals = Deal.new(params)
  @deals.save()
  erb(:"deals/new")
end