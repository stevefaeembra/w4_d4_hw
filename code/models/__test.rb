require_relative('./account')
require_relative('./vendor')
require_relative('./category')
require_relative('./commitment')
require_relative('./income')

# this is a quick test to make sure my
# changes to SqlRunner actually work

# accounts table
account = Account.new({"name"=>"Second Account"})
account.save
account.name = "Second Account, updated!"
account.update
Account.all.each do |record|
  p record
end
account2 = Account.find(account.id)
p account2
account2.delete

# vendors table
vendor = Vendor.new({"name"=>"Test Vendor"})
vendor.save
vendor.name = "Test vendor, updated"
vendor.update
Vendor.all.each do |record|
  p record
end
vendor.delete

# categories table
category = Category.new({"name"=>"Test Category"})
category.save
category.name = "Test category, updated"
category.update
Category.all.each do |record|
  p record
end
category.delete

# commitements

commitment = Commitment.new({
    "name" => "Test Commitment",
    "vendor_id" => 1,
    "account_id" => 1,
    "amount" => 50.0,
    "day_in_month" => 12
})
p commitment
commitment.save
commitment = Commitment.find(commitment.id)
p commitment
commitment.amount = 50.50
commitment.day_in_month = 2
commitment.update
commitment = Commitment.find(commitment.id)
p commitment
Commitment.all.each do |record|
  p record
end
commitment.delete

# incomes
income = Income.new({
    "name" => "Test Income",
    "account_id" => "1",
    "amount" => "1500.0",
    "regular" => "True",
    "day_in_month" => "17"
})
p income
income.save
income = Income.find(income.id)
p income
income.amount = 1555.55
income.day_in_month = 19
income.regular = "False"
income.update
income = Income.find(income.id)
p income
Income.all.each do |record|
  p record
end
