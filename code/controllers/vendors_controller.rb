require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vendor')
also_reload('../models/*')

get '/vendors' do
  # raw vendors view
  @vendors = Vendor.all
  erb(:vendors)
end
