require_relative('../db/sql_runner')

class Commitment

  attr_reader :id
  attr_accessor :name, :account_id, :vendor_id, :amount, :day_in_month

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @account_id = options['account_id'].to_i
    @vendor_id = options['vendor_id'].to_i
    @amount = options['amount'].to_f
    @day_in_month = options['day_in_month'].to_i
  end

  def save
    sql = '
      INSERT INTO commitments ("name","account_id","vendor_id","amount","day_in_month") VALUES ($1,$2,$3,$4,$5) RETURNING *;
    '
    params = [@name, @account_id, @vendor_id, @amount, @day_in_month]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from commitments order by day_in_month asc;"
    return SqlRunner.all(sql,[],Commitment)
  end

  def self.find(id)
    sql = "SELECT * from commitments WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Commitment)
  end

  def update
    # used $1 as id, so that if I add new
    # fields later I don't have to renumber
    # everything ;-)
    sql = 'UPDATE commitments SET ("name","account_id","vendor_id","amount","day_in_month") = ($2,$3,$4,$5,$6) WHERE id=$1 RETURNING *;'
    params = [@id,@name,@account_id,@vendor_id,@amount,@day_in_month]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from commitments WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
