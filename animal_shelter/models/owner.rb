require_relative('./animal.rb')

class Owner
  
  attr_accessor :name, :animals, :id
  
  def intiialize(options)
    @name = options['name']
    @animals = options['animals']
    @id = options['id'].to_i if options['id']
  end

end