-- populate db. I'm more comfortable with SQL
-- than Ruby/Sinatra, so I thought I'd write and
-- test the fixtures in SQL/Postico first, and -- use the queries when I write the code later.

-- accounts

INSERT INTO accounts (name) values ('Test Account');

-- categories/tags

INSERT INTO categories(name) values ('food');
INSERT INTO categories(name) values ('drink');
INSERT INTO categories(name) values ('entertainment');
INSERT INTO categories(name) values ('travel');
INSERT INTO categories(name) values ('housing');
INSERT INTO categories(name) values ('utilities');
INSERT INTO categories(name) values ('childcare');
INSERT INTO categories(name) values ('insurance');
INSERT INTO categories(name) values ('internet');
INSERT INTO categories(name) values ('savings');

-- vendors

INSERT INTO vendors(name) values ('scotmid');
INSERT INTO vendors(name) values ('tescos');
INSERT INTO vendors(name) values ('sainsburys');
INSERT INTO vendors(name) values ('bank'); --4
INSERT INTO vendors(name) values ('gym'); --5
INSERT INTO vendors(name) values ('council'); --6
INSERT INTO vendors(name) values ('marks and spencers'); --7
INSERT INTO vendors(name) values ('post office');
INSERT INTO vendors(name) values ('waitrose');
INSERT INTO vendors(name) values ('greggs'); --10
INSERT INTO vendors(name) values ('wagamama');
INSERT INTO vendors(name) values ('isa provider');
INSERT INTO vendors(name) values ('john lewis');

-- sample incomes

INSERT INTO incomes(account_id,name,amount,
regular,day_in_month) VALUES (1,'Salary',1560.33,TRUE,13);

-- sample commitments

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('Mortgage',1,4,400.00,4);

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('Gym Subs',1,5,35.00,1);

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('Council Tax',1,6,112.00,28);

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('ISA',1,12,50.00,28);

-- sample transactions

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (1,7,2017,'Slightly soggy sammich',4.15,7,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (3,7,2017,'Breakfast Baguette, Yum',2.50,10,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (5,7,2017,'Food shop',12.25,1,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (5,7,2017,'Light bulbs and a thermos flask',22.95,13,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (15,7,2017,'Food and wine',18.00,1,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (21,7,2017,'Two tins of Stella and a packet of Crisps',5.50,9,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (15,7,2017,'registered post letter for jury duty grrrr',6.50,8,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (19,7,2017,'Food shop',36.00,1,1);

INSERT INTO transactions (day_in_month,month,year,notes,amount,vendor_id,account_id) VALUES (15,7,2017,'Lunch at Wagamama',16.00,11,1);

-- lets hook transactions to tags!
-- classifications hook transactions to tags
-- many to many

INSERT INTO classifications
(transactions_id, categories_id) VALUES (1,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (2,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (3,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (4,5);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (5,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (6,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (8,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (9,1);
INSERT INTO classifications
(transactions_id, categories_id) VALUES (9,3);
