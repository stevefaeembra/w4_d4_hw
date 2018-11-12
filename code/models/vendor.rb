require_relative('../db/sql_runner')

class Vendor

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = '
      INSERT INTO vendors ("name") VALUES ($1) RETURNING *;
    '
    params = [@name]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from vendors;"
    return SqlRunner.all(sql,[],Vendor)
  end

  def self.find(id)
    sql = "SELECT * from vendors WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Vendor)
  end

  def update
    sql = "UPDATE vendors SET name = $1 WHERE id=$2 RETURNING *;"
    params = [@name,@id]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from vendors WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
