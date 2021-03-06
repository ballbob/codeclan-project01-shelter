require_relative('../db/sql_runner.rb')

class Owner
  
  attr_accessor :name, :id, :experience
  
  def initialize(options)
    @name = options['name']
    @experience = options['experience']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO owners (name, experience) 
    VALUES (
    '#{@name}',
    '#{@experience}') RETURNING *;"
    result = SqlRunner.run(sql)
    resultobject = result.map { |owner| Owner.new(owner)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def self.delete_all
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM owners;"
    result = SqlRunner.run(sql)
    resultobject = result.map { |owner| Owner.new(owner)}
  end

  def delete
    sql = "DELETE FROM owners WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE owners SET
    name = '#{@name}',
    experience = '#{@experience}'
    WHERE id = '#{@id}'"
    SqlRunner.run(sql)
  end

  def self.display(id)
    sql = "SELECT * FROM owners WHERE id= #{id}"
    result = SqlRunner.run(sql)
    resultobject = result.map { |owner| Owner.new(owner)}
    return resultobject.first
  end

end