require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/classification')
also_reload('../models/*')

get '/classifications' do
  # raw classifications view
  @classifications = Classification.all
  erb(:classifications)
end
