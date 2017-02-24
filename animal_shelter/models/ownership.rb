class Ownership

  attr_accessor :id, :animal_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save
    sql = "INSERT INTO ownerships (animal_id,owner_id)
    VALUES (
    '#{@animal_id}',
    '#{@owner_id}') RETURNING *"
    result = SqlRunner.run(sql)
    resultobject = result.map { |ownership| Ownership.new(ownership)}
    idasstring = resultobject.id
    @id = idasstring.to_i
  end

  def self.delete_all
    sql = "DELETE FROM ownerships;"
    SqlRunner.run(sql)
  end

end