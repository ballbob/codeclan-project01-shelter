require_relative('./animal.rb')

class Owner
  
  attr_accessor :name, :id, :experience
  
  def intiialize(options)
    @name = options['name']
    @experience = options['experience']
    @id = options['id'].to_i if options['id']
  end

end