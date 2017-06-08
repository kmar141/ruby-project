require_relative( '../db/sql_runner' )

class Burger

  attr_reader( :name, :id )

  def initialize ( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO burgers (
      name
    ) VALUES (
      '#{ @name }') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

end

