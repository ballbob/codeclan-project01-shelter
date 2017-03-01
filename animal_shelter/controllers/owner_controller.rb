require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')

# owners
get '/shelter/owners/?' do
  @owners = Owner.all
  erb(:"owner/index")
end

get '/shelter/owners/new/?' do
  @owners = Owner.all
  erb(:"owner/new")
end

post '/shelter/owners/?' do
  @owner = Owner.new(params)
  @owner.save
  redirect to ("/shelter/owners")
end

get '/shelter/owners/delete/?' do
  @owners = Owner.all
  erb(:"owner/destroy")
end

post '/shelter/owners/delete' do
  @owner = Owner.new(params)
  @owner.delete
  redirect to ("/shelter/owners")
end

get '/shelter/owners/:id/update/?' do
  @owner = Owner.display(params[:id])
  erb(:"owner/update")
end

post '/shelter/owners/:id/update' do
  @owner = Owner.new(params)
  @owner.update
  redirect to ('/shelter/owners')
end

