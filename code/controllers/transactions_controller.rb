require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction')
also_reload('../models/*')

get '/transactions' do
  # raw transactions view
  @xactions = Transaction.all
  erb(:transactions)
end
