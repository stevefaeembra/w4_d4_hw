require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/income')
also_reload('../models/*')

get '/incomes' do
  # raw incomes view
  @incomes = Income.all
  erb(:incomes)
end
