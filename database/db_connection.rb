# -*- coding: utf-8 -*-
require "singleton"
require "sqlite3"

module Gawibawibo
  module Database
    DATABASE_FILE = "resources/gawibawibo.db"

    class DBConnection
      include Singleton
      def initialize
        @db = 

      end
      
      def signup( username, password )
        
      end

      def create_user username, password
        @db.query "INSERT INTO users" 
      end

    end
  end
end
