# script to delete and recreate database
echo "Dropping database"
dropdb moneytracker
echo "Recreating database"
createdb moneytracker
echo "Setting up tables"
psql -d moneytracker -f ./make_database.sql
echo "Populating tables with sample data"
psql -d moneytracker -f ./fixtures.sql
echo "Done!"
