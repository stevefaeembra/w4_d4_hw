require_relative('../db/sql_runner')
require('pp')

class Summary

  # class used for the summary view
  # can act as a read-only proxy for
  # Commitments, Transactions, Incomes

  attr_reader :id
  attr_accessor :day_in_month, :type, :type_id, :name, :vendor, :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @day_in_month = options['dom'].to_i
    @type = options['type']
    @type_id = options['type_id'].to_i
    @name = options['name']
    @vendor = options['vendor']
    @amount = options['amount'].to_f
  end

  def self.all
    # this is a bit of a monster.
    # it provides a consistent facade
    # for three different tables and
    # unions them together followed by
    # sort on day-of-month to merge them
    sql ='
    with i as (
      -- incomes
      select
        i.day_in_month as dom,
        1::INT4 as type,
        i.id as id,
        i.name as "name", -- name is reserved
        null as vendor,
        i.amount
      from
        accounts a
        left join incomes i
        on a.id = i.account_id
      where
        a.id = 1
      order by
      	dom asc
    ),
    c as (
      -- commitments
      select
        c.day_in_month as dom,
        2::INT4 as type,
        c.id as id,
        c.name as "name", -- name is reserved
        v.name as vendor,
        c.amount
      from
        accounts a
        left join commitments c
        on a.id = c.account_id
        left join vendors v
        on c.vendor_id = v.id
      where
        a.id = 1
      order by
      	dom asc
    ),
    t as (
      -- transactions
      select
      	t.day_in_month as dom,
        3::INT4 as type,
        t.id as id,
        t.notes as "name", -- name is reserved
        v.name as vendor,
        t.amount
      from
        accounts a
        left join transactions t
          on a.id = t.account_id
        left join vendors v
          on t.vendor_id = v.id
      where
        a.id = 1
      order by
      	dom asc
    )
    -- concatenate the 3 tables together.
    -- They have the exactly the same columns
    -- so we can do this :-)
    select
      * from c
      union
      	select * from t
      	union
      		select * from i
     order by
     	dom asc;
    '
    return SqlRunner.all(sql,[],Summary)
  end

end
