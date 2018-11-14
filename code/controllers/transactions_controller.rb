require('sinatra')
require('sinatra/contrib/all')
require('date')
require_relative('../models/transaction')
require_relative('../models/classification')
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
  # create and save a new Transaction, create/delete classifications
  xaction = Transaction.new(params)
  xaction.save

  # add tags as required
  category_names = params["categories"].split(" ")
  Classification.register(xaction.id,category_names)

  redirect to '/summary'
end

get '/transactions/:id/edit' do
  # show form for transaction editing
  @vendors = Vendor.all
  @accounts = Account.all
  @transaction = Transaction.find(params[:id])
  @tags = @transaction.get_tags
  @tag_names = @transaction.get_tag_names
  erb(:transaction_edit)
end

post '/transactions/:id' do
  # update an existing transaction
  transaction = Transaction.new(params)
  transaction.update

  # handle categories
  category_names = params["categories"].split(" ")
  Classification.register(transaction.id,category_names)

  redirect to '/summary'
end

get '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete
  @summaries = Summary.all
  erb(:summaries)
end
