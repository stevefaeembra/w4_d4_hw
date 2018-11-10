require_relative('../db/sql_runner')

class Account

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = '
      INSERT INTO accounts ("name") VALUES ($1) RETURNING *;
    '
    params = [@name]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from accounts;"
    return SqlRunner.all(sql,Account)
  end

  def self.find(id)
    sql = "SELECT * from accounts WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Account)
  end

  def update
    sql = "UPDATE accounts SET name = $1 WHERE id=$2 RETURNING *;"
    params = [@name,@id]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from accounts WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
