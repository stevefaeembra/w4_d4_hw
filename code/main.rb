require('sinatra')
require('sinatra/contrib/all')

# delegates other routes to various controllers
require_relative('controllers/transactions_controller')
require_relative('controllers/incomes_controller')
require_relative('controllers/commitments_controller')
require_relative('controllers/vendors_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/accounts_controller')
require_relative('controllers/classifications_controller')
require_relative('controllers/summary_controller')
require_relative('./models/summary')

get '/' do
  @summaries = Summary.all
  erb( :summaries )
end
