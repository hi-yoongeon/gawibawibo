require "singleton"

module Gawibawibo
  module Game

    class Square
      include Singleton
      
      def initialize
        @users = []
      end

      def enter( user )
        @users << user
      end

      def exit( user )
        @user.delete user
      end

      def joined_user_list

      end
    end

  end
end
