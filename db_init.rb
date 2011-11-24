$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include? File.dirname(__FILE__)

require "database/db_manager"
Gawibawibo::Database::DBManager::truncate_table_users
Gawibawibo::Database::DBManager::truncate_table_match_logs
