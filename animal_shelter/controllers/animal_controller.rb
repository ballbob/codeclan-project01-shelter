require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

# animals
get '/animals' do
  @animals = Animal.all
  erb(:"animal/index")
end

get '/animals/new' do
  @animals = Animal.all
  erb(:"animal/new")
end

post '/animals/?' do
  animal = Animal.new(params)
  animal.save
  redirect to ('animals')
end

get '/animals/delete' do
  @animals = Animal.all
  erb(:"animal/destroy")
end

post '/animals/delete' do
  animal = Animal.new(params)
  animal.delete
  redirect to ('/animals')
end

get '/animals/:id/edit' do
  @animal = Animal.display(params[:id])
  erb(:"animal/edit")
end

post '/animals/:id/edit' do
  @animal = Animal.new(params)
  admission = Animal.display(params[:id]).admission_date.to_s
  @animal.admission_date = admission 
  @animal.update
  redirect to ('/animals')
end

get '/animals/:id/profile' do
  @animal = Animal.display(params[:id])
  erb(:"animal/profile")
end