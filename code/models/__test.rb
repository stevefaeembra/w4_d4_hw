require_relative('./account')
require_relative('./vendor')
require_relative('./category')

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
