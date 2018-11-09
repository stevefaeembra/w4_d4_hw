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
INSERT INTO vendors(name) values ('marks and spencers');
INSERT INTO vendors(name) values ('post office');
INSERT INTO vendors(name) values ('waitrose');
INSERT INTO vendors(name) values ('greggs');
INSERT INTO vendors(name) values ('wagamama');
INSERT INTO vendors(name) values ('isa provider');

-- sample incomes

INSERT INTO incomes(account_id,name,amount,
regular,day_in_month) VALUES (1,'Salary',1560.33,TRUE,13);

-- sample commitments

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('Mortgage',1,4,400.00,4);

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('Gym Subs',1,5,35.00,1);

INSERT INTO commitments (name,account_id,vendor_id,amount,day_in_month) VALUES('Council Tax',1,6,112.00,28);
