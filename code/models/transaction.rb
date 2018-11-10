require_relative('../db/sql_runner')

class Transaction

  attr_reader :id
  attr_accessor :day_in_month, :month, :year, :notes, :amount, :account_id, :vendor_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @day_in_month = options['day_in_month'].to_i
    @month = options['month'].to_i
    @year = options['year'].to_i
    @notes = options['notes']
    @account_id = options['account_id'].to_i
    @vendor_id = options['vendor_id'].to_i
    @amount = options['amount'].to_f
  end

  def save
    sql = '
      INSERT INTO transactions ("day_in_month", "month", "year", "notes", "amount", "account_id", "vendor_id") VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *;
    '
    params = [@day_in_month, @month, @year, @notes, @amount, @account_id, @vendor_id]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from transactions;"
    return SqlRunner.all(sql,Transaction)
  end

  def self.find(id)
    sql = "SELECT * from transactions WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Transaction)
  end

  def update
    sql = 'UPDATE transactions SET ("day_in_month", "month", "year", "notes", "amount", "account_id", "vendor_id") = ($2,$3,$4,$5,$6,$7,$8) WHERE id=$1 RETURNING *;'
    params = [@id,@day_in_month,@month,@year, @notes, @amount, @account_id, @vendor_id]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from transactions WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
