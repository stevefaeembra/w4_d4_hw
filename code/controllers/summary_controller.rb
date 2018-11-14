require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/summary')
also_reload('../models/*')

get '/summary' do
  # summaries view, this interleaves
  # all transactions, incomes and commitments for a given month
  @summaries = Summary.all()
  @total = Summary.total()
  erb(:summaries)
end

get '/edit_router/:id/:class' do
  # redirects routing to one of the
  # edit routes depending on type (:class) which is T, I or C
  case params[:class]
    when 'T'
      redirect to "/transactions/#{params[:id]}/edit"
    when 'I'
      redirect to "/incomes/#{params[:id]}/edit"
    when 'C'
      redirect to "/commitments/#{params[:id]}/edit"
  end
end


get '/delete_router/:id/:class' do
  # redirects request to one of the
  # delete routes depending on type (:class) which is T, I or C
  case params[:class]
    when 'T'
      redirect to "/transactions/#{params[:id]}/delete"
    when 'I'
      redirect to "/incomes/#{params[:id]}/delete"
    when 'C'
      redirect to "/commitments/#{params[:id]}/delete"
  end
end
