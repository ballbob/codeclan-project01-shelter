require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
require_relative('./models/ownership.rb')

get '/shelter' do
  erb(:index)
end

get '/shelter/animals' do
  @animals = Animal.all
  erb(:"animal/index")
end

get '/shelter/animals/new' do
  @animals = Animal.all
  erb(:"animal/new")
end

post '/shelter/animals' do
  animal = Animal.new(params)
  animal.save
  redirect to ("/animals")
end

get '/shelter/owners' do
  @owners = Owner.all
  erb(:"owner/index")
end

get '/shelter/owners/new' do
  @owners = Owner.all
  erb(:"owner/new")
end

post '/shelter/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to ("/owners")
end

get '/shelter/ownerships' do
  @ownerships = Ownership.all
  erb(:"ownerships/index")
end

get '/shelter/ownerships/new' do
  @ownerships = Ownership.all
  erb(:"ownerships/new")
end

post '/shelter/ownerships' do
  @ownership = Ownership.new(params)
  @ownership.save
  redirect to ("/ownerships")
end