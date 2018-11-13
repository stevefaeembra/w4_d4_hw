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

get '/commitments/:id/edit' do
  # show form for commitment editing
  @vendors = Vendor.all
  @accounts = Account.all
  @commitment = Commitment.find(params[:id])
  erb(:commitment_edit)
end

post '/commitments/:id' do
  # update an existing commitment
  commitment = Commitment.new(params)
  commitment.update
  redirect to '/commitments'
end

get '/commitments/:id/delete' do
  commitment = Commitment.find(params[:id])
  commitment.delete
  @commits = Commitment.all
  erb(:commitments)
end
