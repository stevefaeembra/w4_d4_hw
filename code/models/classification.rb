require_relative('../db/sql_runner')

class Classification

  attr_reader :id
  attr_accessor :transactions_id, :categories_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transactions_id = options['transactions_id'].to_i if options['transactions_id']
    @categories_id = options['categories_id'].to_i if options['categories_id']
  end

  def save
    sql = '
      INSERT INTO classifications ("transactions_id","categories_id") VALUES ($1,$2) RETURNING *;
    '
    params = [@transactions_id,@categories_id]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from classifications;"
    return SqlRunner.all(sql,[],Classification)
  end

  def self.find(id)
    sql = "SELECT * from classifications WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Classification)
  end

  # @TODO add method to get classifications
  # for a given transaction id or to get transactions for a given category id

  def update
    sql = 'UPDATE classifications SET (transactions_id,categories_id)= ($2,$3) WHERE id=$1 RETURNING *;'
    params = [@id, @transactions_id, @categories_id]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from classifications WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
