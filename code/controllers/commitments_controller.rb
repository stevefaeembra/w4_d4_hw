require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/commitment')
require_relative('../models/account')
require_relative('../models/vendor')
also_reload('../models/*')

get '/commitments' do
  # raw commitments view
  @commits = Commitment.all
  erb(:commitments)
end

get '/commitments/new' do
  # show form for new commitment creation
  @vendors = Vendor.all
  @accounts = Account.all
  erb(:commitment)
end

post '/commitments' do
  # create and save a new Commitment
  commitment = Commitment.new(params)
  commitment.save
  redirect to '/commitments'
end
