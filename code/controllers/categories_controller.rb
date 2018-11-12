require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
also_reload('../models/*')

get '/categories' do
  # raw categories view
  @categories = Category.all
  erb(:categories)
end

get '/categories/new' do
  # show form for new category creation
  erb(:category)
end

post '/categories' do
  # create and save a new Category
  category = Category.new(params)
  category.save
  redirect to '/categories'
end

get '/categories/:id/delete' do
  category = Category.find(params[:id])
  category.delete
  @categories = Category.all
  erb(:categories)
end
