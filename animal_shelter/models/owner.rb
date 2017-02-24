require_relative('./animal.rb')

class Owner
  
  attr_accessor :name, :id, :experience
  
  def initialize(options)
    @name = options['name']
    @experience = options['experience']
    @id = options['id'].to_i if options['id']
  end

end