require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')

# owners
get '/owners/?' do
  @owners = Owner.all
  erb(:"owner/index")
end

get '/owners/new' do
  @owners = Owner.all
  erb(:"owner/new")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to ("/owners")
end

get '/owners/delete' do
  @owners = Owner.all
  erb(:"owner/destroy")
end

post '/owners/delete' do
  @owner = Owner.new(params)
  @owner.delete
  redirect to ("/owners")
end

get '/owners/:id/edit' do
  @owner = Owner.display(params[:id])
  erb(:"owner/edit")
end

post '/owners/:id/edit' do
  @owner = Owner.new(params)
  @owner.update
  redirect to ('/owners')
end

