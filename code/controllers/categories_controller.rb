require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
also_reload('../models/*')

get '/categories' do
  # raw categories view
  @categories = Category.all
  erb(:categories)
end
