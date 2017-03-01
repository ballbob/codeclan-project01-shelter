require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/ownership.rb')

# adoptions
get '/shelter/ownerships/?' do
  @ownerships = Ownership.all
  @animals = Animal.all
  @owners = Owner.all
  erb(:"ownerships/index")
end

get '/shelter/ownerships/new/?' do
  @ownerships = Ownership.all
  @animals = Animal.all
  @owners = Owner.all
  erb(:"ownerships/new")
end

post '/shelter/ownerships/new/?' do
  @ownership = Ownership.new(params)
  @ownership.save
  redirect to ("/shelter/ownerships")
end

get '/shelter/ownerships/delete/?' do
  @ownerships = Ownership.all
  erb(:"ownerships/destroy")
end

post '/shelter/ownerships/delete/?' do
  @ownership = Ownership.new(params)
  @ownership.delete()
  redirect to ("/shelter/ownerships")
end

get '/shelter/ownerships/:id/update' do
  @ownership = Ownership.display(params[:id])
  erb(:"ownerships/update")
end

post '/shelter/ownerships/:id/update' do
  @ownership = Ownership.new(params)
  @ownership.update
  redirect to ('/shelter/ownerships')
end