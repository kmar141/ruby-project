require_relative( '../db/sql_runner' )
require_relative ( 'deal' )
require_relative ( 'eatery' )

class Burger

  attr_reader( :name, :id )

  def initialize ( options )
    @id = options['id'].to_i
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

  def self.all()
    sql = "SELECT * FROM burgers;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Burger.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM burgers WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Burger.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    SqlRunner.run( sql )
  end

  def update(options)
    sql = "UPDATE burgers SET (name) = (
      '#{options['name']}')
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM burgers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

end

