# Database reset script for DocuSeal
# This script will drop all tables and recreate them

puts "Starting database reset..."

# Drop all tables
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  puts "Dropping table: #{table}"
  ActiveRecord::Base.connection.drop_table(table, force: :cascade)
end

puts "All tables dropped. Running migrations..."

# Run migrations to recreate tables
system("rails db:migrate")

puts "Database reset complete!"