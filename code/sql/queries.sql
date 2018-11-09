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
