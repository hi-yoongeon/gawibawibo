# -*- coding: utf-8 -*-
require "database/db_manager"
require "database/model/user"


module Gawibawibo
  module Network
    class Authentication
      def initialize
        @db = Database::DBManager.new
      end
      
      def signup( username, password )
        user = Database::Model::User.new username, password
        is_exist_user = @db.exist_user? user
        @db.signup user unless is_exist_user
        return is_exist_user
      end

      def signin( username, password )
        user = Database::Model::User.new username, password
        @db.signin user
      end

      def exist_user? user
        @db.exist_user? user
      end

    end
  end
end
