-- DELETE. Release the bridging tables first, then parts, then collections. (Basically, in reverse order relative to their creation.)

DROP TABLE IF EXISTS classifications;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS commitments;
DROP TABLE IF EXISTS incomes;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS accounts;

-- accounts. We'll assume one account for now.

CREATE TABLE accounts (
  id SERIAL4 PRIMARY KEY,
  name TEXT
);

-- vendors
CREATE TABLE vendors (
  id SERIAL4 PRIMARY KEY,
  name TEXT
);

-- tag names
CREATE TABLE categories (
  id SERIAL4 PRIMARY KEY,
  name TEXT
);

-- incomes
-- these are one-off or regular incoming

CREATE TABLE incomes (
  id SERIAL4 PRIMARY KEY,
  account_id INT4 REFERENCES accounts(id),
  name TEXT,
  amount REAL,
  regular BOOLEAN,
  day_in_month INT4 -- optional
);

-- commitments
-- these are regular scheduled transactions
-- that happen on the same day each month
-- no need for one-off commitments; use transactions for those!

CREATE TABLE commitments (
  id SERIAL4 PRIMARY KEY,
  name TEXT NOT NULL,
  account_id INT4 REFERENCES accounts(id),
  vendor_id INT4 REFERENCES vendors(id),
  amount REAL,
  day_in_month INT4
);

-- transactions, represent a discretionary spend

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  day_in_month INT4,
  month INT4,
  year INT4,
  notes TEXT,
  amount REAL,
  vendor_id INT4 REFERENCES vendors(id),
  account_id INT4 REFERENCES accounts(id)
);

-- finally, any bridging tables

CREATE TABLE classifications (
  id SERIAL4 PRIMARY KEY,
  transactions_id INT4 REFERENCES transactions(id),
  categories_id INT4 REFERENCES categories(id)
);
