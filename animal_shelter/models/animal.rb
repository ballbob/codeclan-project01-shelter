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

  def delete
    sql = "DELETE FROM animals WHERE id= #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def owner
    sql = "SELECT * FROM owners
    INNER JOIN ownerships ON owner_id = owners(id)
    WHERE animal_id = #{@id}"
    result = SqlRunner.run(sql)
    resultobject = result.map { |owner| Owner.new(owner)}
    return resultobject
  end

  def self.all
    sql = "SELECT * FROM animals;"
    result = SqlRunner.run(sql)
    resultobject = result.map { |animal| Animal.new(animal)}
  end

  def update
    sql = "UPDATE animals SET
    
    name = '#{@name}',
    adoptable = '#{@adoptable}',
    admission_date = '#{@admission_date}',
    type = '#{@type}'
    
    WHERE id = #{@id};",
    SqlRunner.run(sql)
  end

end