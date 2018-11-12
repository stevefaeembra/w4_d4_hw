require('sinatra')
require('sinatra/contrib/all')

# delegates other routes to various controllers
require_relative('controllers/transactions_controller')
require_relative('controllers/incomes_controller')
require_relative('controllers/commitments_controller')
require_relative('controllers/vendors_controller')
require_relative('controllers/categories_controller')

get '/' do
  erb( :hello )
end
