require_relative( '../db/sql_runner' )
require_relative ( 'burger' )
require_relative ( 'eatery' )

class Deal

  attr_reader( :name, :id, :day, :eatery_id )

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
    @day = options['day']
    @eatery_id = options['eatery_id']
  end

  def save()
    sql = "INSERT INTO deals (
      name, day, eatery_id
    ) VALUES (
      '#{ @name }', '#{ @day }', #{ @eatery_id }) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

    def self.all()
      sql = "SELECT * FROM deals;"
      results = SqlRunner.run( sql )
      return results.map { |hash| Deal.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM deals WHERE deals.id=#{id}"
      results = SqlRunner.run( sql )
      return Deal.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM deals"
      SqlRunner.run( sql )
    end

    def update(options)
      sql = "UPDATE deals SET (name, day, eatery_id) = (
        '#{options['name']}', '#{options['day']}', '#{options['eatery_id']}')
      WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM deals WHERE id = #{@id};"
      SqlRunner.run(sql)
    end

  end