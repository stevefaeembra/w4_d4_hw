require('sinatra')
require('sinatra/contrib/all')

# delegates other routes to various controllers
require_relative('controllers/transactions_controller') 

get '/' do
  erb( :hello )
end
