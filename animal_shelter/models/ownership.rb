require_relative('../db/sql_runner.rb')

class Ownership

  attr_accessor :id, :animal_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save
    sql = "INSERT INTO ownerships 
    ( animal_id, owner_id )
    VALUES (
    '#{@animal_id}',
    '#{@owner_id}') RETURNING *"
    result = SqlRunner.run(sql)
    resultobject = result.map { |ownership| Ownership.new(ownership)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def self.delete_all
    sql = "DELETE FROM ownerships;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM ownerships;"
    result = SqlRunner.run(sql)
    resultobject = result.map {|ownership| Ownership.new(ownership)}
  end

  def delete
    sql = "DELETE FROM ownerships WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def animal
    sql = "SELECT * FROM animals 
      INNER JOIN ownerships
      ON ownerships.animal_id = animals.id
      WHERE animals.id = #{@animal_id}"
      result = SqlRunner.run(sql)
      return Animal.new(result.first)
    end

  def owner
    sql = "SELECT * FROM owners
    INNER JOIN ownerships
    ON ownerships.owner_id = owners.id
    WHERE owners.id = #{@owner_id}"
    result = SqlRunner.run(sql)
    return Owner.new(result.first)
  end 

  def self.display(id)
    sql = "SELECT * FROM ownerships WHERE id = #{id}"
    result = SqlRunner.run(sql)
    resultobject = result.map { |ownership| Ownership.new(ownership)}
    return resultobject.first
  end

def update
  sql = "UPDATE ownerships SET 
    owner_id = '#{@owner_id}',
    animal_id = '#{@animal_id}'
    WHERE id = #{@id};"
  SqlRunner.run(sql)
end

end