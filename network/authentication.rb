# -*- coding: utf-8 -*-
require "database/db_manager"



module Gawibawibo
  module Network
    class Authentication
      def initialize
        @db = Database::DBManager.new
      end
      
      def signup( user )
        @db.signup user unless @db.exist_user? user
      end

      def signin( user )
        @db.signin user
      end

      def exist_user? user
        @db.exist_user? user
      end

    end
  end
end
