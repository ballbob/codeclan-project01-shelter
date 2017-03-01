require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
require_relative('./models/ownership.rb')

# index
get '/shelter/?' do
  erb(:index)
end


# animals
get '/shelter/animals/?' do
  @animals = Animal.all
  erb(:"animal/index")
end

get '/shelter/animals/new/?' do
  @animals = Animal.all
  erb(:"animal/new")
end

post '/shelter/animals/?' do
  animal = Animal.new(params)
  animal.save
  redirect to ('/shelter/animals')
end

get '/shelter/animals/delete/?' do
  @animals = Animal.all
  erb(:"animal/destroy")
end

post '/shelter/animals/delete/?' do
  animal = Animal.new(params)
  animal.delete
  redirect to ('/shelter/animals')
end

get '/shelter/animals/:id/update/?' do
  @animal = Animal.display(params[:id])
  erb(:"animal/update")
end

post '/shelter/animals/:id/update/?' do
  @animal = Animal.new(params)
  admission = Animal.display(params[:id]).admission_date.to_s
  @animal.admission_date = admission 
  #binding.pry
  @animal.update
  redirect to ('/shelter/animals')
end

get '/shelter/animals/:id/profile/?' do
  @animal = Animal.display(params[:id])
  erb(:"animal/profile")
end

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

post '/shelter/owners/delete/?' do
  @owner = Owner.new(params)
  @owner.delete
  redirect to ("/shelter/owners")
end

get '/shelter/owners/:id/update/?' do
  @owner = Owner.display(params[:id])
  erb(:"owner/update")
end

post '/shelter/owners/:id/update/?' do
  @owner = Owner.new(params)
  @owner.save
  redirect to ('/shelter/owners')
end



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