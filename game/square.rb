require "singleton"
require "json"

module Gawibawibo
  module Game

    class Square
      include Singleton
      
      def initialize
        @users = {}
      end

      def enter( user )
        username = user.model.username
        @users[username] = user unless @users.has_key? username
      end

      def exit( user )
        @users.delete user.model.username
      end

      def joined_user_list
        entered_square_user = []
        @users.each_value do |user|
          entered_square_user << user.model.to_json
        end
        entered_square_user.to_json
      end
      
      

    end

  end
end
