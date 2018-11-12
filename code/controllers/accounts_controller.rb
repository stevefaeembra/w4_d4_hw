require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/account')
also_reload('../models/*')

get '/accounts' do
  # raw accounts view
  @accounts = Account.all
  erb(:accounts)
end

get '/accounts/new' do
  # show form for new account creation
  erb(:account)
end

post '/accounts' do
  # create and save a new Account
  account = Account.new(params)
  account.save
  redirect to '/accounts'
end

get '/accounts/:id/delete' do
  # delete account with a GET?
  # yeah! let's live dangerously :-)
  account = Account.find(params[:id])
  account.delete
  @accounts = Account.all
  erb(:accounts)
end
