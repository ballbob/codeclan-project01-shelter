require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

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
  @animal.update
  redirect to ('/shelter/animals')
end

get '/shelter/animals/:id/profile/?' do
  @animal = Animal.display(params[:id])
  erb(:"animal/profile")
end