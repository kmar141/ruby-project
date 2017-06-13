require_relative( '../db/sql_runner' )
require_relative ( 'deal' )
require_relative ( 'eatery' )

class Burger

  attr_reader( :name, :id, :eatery_id )

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
    @eatery_id = options['eatery_id']
  end

  def save()
    sql = "INSERT INTO burgers (
      name, eatery_id
    ) VALUES (
      '#{ @name }', #{ @eatery_id }) RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM burgers;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Burger.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM burgers WHERE burgers.id=#{id}"
    results = SqlRunner.run( sql )
    return Burger.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM burgers;"
    SqlRunner.run( sql )
  end

  def update(options)
    sql = "UPDATE burgers SET (name, eatery_id) = (
      '#{options['name']}', #{options['eatery_id']})
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM burgers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


end

