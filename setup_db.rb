require 'sqlite3'

# Open SQLite database (this will create the database if it doesn't exist)
db = SQLite3::Database.new "sessions.db"

# Ensure the sessions table exists by creating it if not already created
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id TEXT,
    user_data TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
  );
SQL

puts "Database and table are set up successfully!"
