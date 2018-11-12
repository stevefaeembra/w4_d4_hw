require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/summary')
also_reload('../models/*')

get '/summary' do
  # summaries view, this interleaves
  # all transactions, incomes and commitments for a given month
  @summaries = Summary.all()
  p @summaries
  erb(:summaries)
end
