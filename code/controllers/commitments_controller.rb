require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/commitment')
also_reload('../models/*')

get '/commitments' do
  # raw commitments view
  @commits = Commitment.all
  erb(:commitments)
end
