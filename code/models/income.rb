require_relative('../db/sql_runner')

class Income

  attr_reader :id
  attr_accessor :name, :account_id, :amount, :regular, :day_in_month

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @account_id = options['account_id'].to_i
    @amount = options['amount'].to_f
    @regular = options['regular']
    @day_in_month = options['day_in_month'].to_i
  end

  def save
    sql = '
      INSERT INTO incomes ("name","account_id","amount","regular","day_in_month") VALUES ($1,$2,$3,$4,$5) RETURNING *;
    '
    params = [@name, @account_id, @amount, @regular, @day_in_month]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from incomes order by day_in_month asc;"
    return SqlRunner.all(sql,[],Income)
  end

  def self.find(id)
    sql = "SELECT * from incomes WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Income)
  end

  def update
    # used $1 as id, so that if I add new
    # fields later I don't have to renumber
    # everything ;-)
    sql = 'UPDATE incomes SET ("name","account_id","amount","regular","day_in_month") = ($2,$3,$4,$5,$6) WHERE id=$1 RETURNING *;'
    params = [@id,@name,@account_id,@amount,@regular,@day_in_month]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from incomes WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
