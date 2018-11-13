require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('../models/transaction')
require_relative('../models/vendor')
require_relative('../models/account')
also_reload('../models/*')

get '/transactions' do
  # raw transactions view
  @xactions = Transaction.all
  erb(:transactions)
end

get '/transactions/new' do
  # show form for new transaction creation
  @vendors = Vendor.all
  @accounts = Account.all
  @categories = Category.all
  @date = DateTime.now
  p @date
  erb(:transaction)
end

post '/transactions' do
  # create and save a new Transaction
  xaction = Transaction.new(params)
  xaction.save
  redirect to '/summary'
end

get '/incomes/:id/delete' do
  income = Income.find(params[:id])
  income.delete
  @incomes = Income.all
  erb(:incomes)
end
