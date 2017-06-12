require_relative( '../db/sql_runner' )
require_relative ( 'burger' )
require_relative ( 'deal' )

class Eatery

  attr_reader( :name, :id, :burger_id, :deal_id )

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO eateries (
      name
    ) VALUES (
      '#{ @name }') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

    def self.all()
      sql = "SELECT * FROM eateries;"
      results = SqlRunner.run( sql )
      return results.map { |hash| Eatery.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM eateries WHERE id=#{id}"
      results = SqlRunner.run( sql )
      return Eatery.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM eateries"
      SqlRunner.run( sql )
    end

    def update(options)
      sql = "UPDATE eateries SET (name) = (
        '#{options['name']}')
      WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM eateries WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

    def burgers()
      sql = "SELECT * FROM burgers 
            WHERE burgers.eatery_id = #{@id};"
      results = SqlRunner.run( sql )
      return results.map { |hash| Burger.new( hash ) }
    end

    def deals()
      sql = "SELECT * FROM deals 
            WHERE deals.eatery_id = #{@id};"
      results = SqlRunner.run( sql )
      return results.map { |hash| Deal.new( hash ) }
    end

  end