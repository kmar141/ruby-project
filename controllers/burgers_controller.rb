require_relative( '../models/burger.rb' )

get '/burgers' do
  @burgers = Burger.all()
  erb ( :"burgers/index" )
end

get '/burgers/new' do
  @burgers = Burger.all
  erb(:"burgers/new")
end

get '/burgers/:id' do
  @burgers = Burger.find(params[:id])
  erb(:"burgers/id")
end

post '/burgers/:id' do
  @burgers = Burger.find(params[:id])
  @burgers.update(params)
  redirect to "/burgers/#{params[:id]}"
end

get '/burgers/:id/edit' do 
  @burgers = Burger.find(params[:id])
  erb(:"burgers/edit")
end

post '/burgers' do
  @burgers = Burger.new(params)
  @burgers.save()
  erb(:"burgers/new")
end

post '/burgers/:id/delete' do
  @burgers = Burger.find(params[:id])
  @burgers.delete()
  redirect to "/burgers"
end