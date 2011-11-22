require "singleton"
require "sqlite3"

module Gawibawibo
  module Database
    DATABASE_FILE = "resources/gawibawibo.db"

    class DBConnection
      include Singleton
      def initialize
        @db = SQLite3::Database.open( DATABASE_FILE )
      end


    end
  end
end
