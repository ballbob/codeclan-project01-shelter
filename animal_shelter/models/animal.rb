require_relative('../db/sql_runner.rb')

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

  def save
    sql = "INSERT INTO animals (name,adoptable,admission_date,type)
    VALUES
    (
    '#{@name}',
    '#{@adoptable}',
    '#{@admission_date}',
    '#{@type}'
    ) 
    RETURNING *;"
    result = SqlRunner.run(sql)
    resultobject = result.map { |animal| Animal.new(animal)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def self.delete_all
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

end