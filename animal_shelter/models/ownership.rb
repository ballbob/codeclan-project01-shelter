class Ownership

  attr_accessor :id, :animal_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

end