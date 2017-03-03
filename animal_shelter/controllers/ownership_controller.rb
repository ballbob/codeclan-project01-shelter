require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/ownership.rb')

# adoptions
get '/ownerships/?' do
  @ownerships = Ownership.all
  @animals = Animal.all
  @owners = Owner.all
  erb(:"ownerships/index")
end

get '/ownerships/new/?' do
  @ownerships = Ownership.all
  @animals = Animal.all
  @owners = Owner.all
  erb(:"ownerships/new")
end

post '/ownerships/new' do
  @ownership = Ownership.new(params)
  @ownership.save
  redirect to ("/ownerships")
end

get '/ownerships/delete' do
  @ownerships = Ownership.all
  erb(:"ownerships/destroy")
end

post '/ownerships/delete' do
  @ownership = Ownership.new(params)
  @ownership.delete()
  redirect to ("/ownerships")
end

get '/ownerships/:id/edit' do
  @ownership = Ownership.display(params[:id])
  @animals = Animal.all
  @owners = Owner.all
  erb(:"ownerships/edit")
end

post '/ownerships/:id' do
  @ownership = Ownership.new(params)
  @ownership.update
  redirect to ('/shelter/ownerships')
end