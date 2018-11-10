require_relative('./account')

# this is a quick test to make sure my
# changes to SqlRunner actually work

account = Account.new({"name"=>"Second Account"})
account.save
account.name = "Second Account, updated!"
account.update
Account.all.each do |record|
  p record
end
account2 = Account.find(account.id)
p account2
account2.delete()
