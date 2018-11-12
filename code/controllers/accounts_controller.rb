require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/account')
also_reload('../models/*')

get '/accounts' do
  # raw accounts view
  @accounts = Account.all
  erb(:accounts)
end
