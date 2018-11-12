require_relative('../db/sql_runner')

class Category

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = '
      INSERT INTO categories ("name") VALUES ($1) RETURNING *;
    '
    params = [@name]
    @id = SqlRunner.create(sql,params)
  end

  def self.all
    sql = "SELECT * from categories order by lower(name) asc;"
    return SqlRunner.all(sql,[],Category)
  end

  def self.find(id)
    sql = "SELECT * from categories WHERE id=$1;"
    params=[id]
    return SqlRunner.get(sql, params, Category)
  end

  def update
    sql = "UPDATE categories SET name = $1 WHERE id=$2 RETURNING *;"
    params = [@name,@id]
    SqlRunner.run(sql,params)
  end

  def delete
    sql = "DELETE from categories WHERE id=$1;"
    params = [@id]
    SqlRunner.run(sql,params)
  end

end
