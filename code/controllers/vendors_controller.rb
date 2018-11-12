require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vendor')
also_reload('../models/*')

get '/vendors' do
  # raw vendors view
  @vendors = Vendor.all
  erb(:vendors)
end

get '/vendors/new' do
  # show form for new vendor creation
  erb(:vendor)
end

post '/vendors' do
  # create and save a new Account
  vendor = Vendor.new(params)
  vendor.save
  redirect to '/vendors'
end
