require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
require_relative('./models/ownership.rb')
require_relative('./controllers/animal_controller.rb')
require_relative('./controllers/owner_controller.rb')
require_relative('./controllers/ownership_controller.rb')

# index
get '/shelter/?' do
  erb(:index)
end