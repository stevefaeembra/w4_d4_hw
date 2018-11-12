-- scratchpad for testing out SQL queries
-- before committing these to code

-- select all accounts
select * from accounts;

-- pretty view of commitments for an account

select
  c.day_in_month as dom,
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
	dom asc;

-- pretty view of incomes for an account
-- TODO no current link to vendor so return NULL

select
  i.day_in_month as dom,
  i.name as "name", -- name is reserved
  NULL as vendor, -- NULL, for now.
  i.amount
from
  accounts a
  left join incomes i
  on a.id = i.account_id
where
  a.id = 1
order by
	dom asc;

-- pretty view of transactions for an account
-- for a given month and year

select
  t.day_in_month as dom,
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
	dom asc;

-- interleaved view, shows all transactions,
-- incomes and commitments in time order.
-- this works PROVIDED we only view one month
-- worth of stuff at a time, either 1..31 or
-- a rolling window e.g. 12th to 12th :-)
-- using a CTE (Common table expression) to make
-- this more readable and avoid having to use
-- subqueries. Each of the subqueries has the same
-- columns so I smoosh them together using UNION
-- and then sort ascending on day-of-month.

with i as (
  -- incomes
  select
    i.day_in_month as dom,
    'Income' as type,
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
    'Commitment' as type,
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
    'Transaction' as type,
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

-- get tags names and ids for a given transaction

with pick as (
	select
		*
	from
		classifications c
	where
		c.transactions_id = 9
)
select
	k.id,
	k.name
from pick c
	inner join transactions t on t.id = c.transactions_id
	inner join categories k on k.id = c.categories_id;
