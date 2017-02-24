class Animal

  attr_accessor :name, :adoptable, :id

  attr_reader :admission_date, :type

  def initialize(options)
    @name = options['name']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
    @type = options['type']
    @id = options['id'].to_i if options['id']
  end

end