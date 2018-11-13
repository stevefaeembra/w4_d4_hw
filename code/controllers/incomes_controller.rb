require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/income')
also_reload('../models/*')

get '/incomes' do
  # raw incomes view
  @incomes = Income.all
  erb(:incomes)
end

get '/incomes/new' do
  # show form for new income creation
  @vendors = Vendor.all
  @accounts = Account.all
  erb(:income)
end

post '/incomes' do
  # create and save a new Income
  income = Income.new(params)
  income.save
  redirect to '/incomes'
end

get '/incomes/:id/edit' do
  # show form for income editing
  @vendors = Vendor.all
  @accounts = Account.all
  @income = Income.find(params[:id])
  erb(:income_edit)
end

post '/incomes/:id' do
  # update an existing income
  income = Income.new(params)
  income.update
  redirect to '/incomes'
end

get '/incomes/:id/delete' do
  income = Income.find(params[:id])
  income.delete
  @incomes = Income.all
  erb(:incomes)
end
