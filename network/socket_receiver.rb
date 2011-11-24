require "network/network_const"

module Gawibawibo
  module Network
    class SocketReceiver

      include NetworkConst

      def initialize conn
        @connection = conn
      end

      def listen
        puts "called receiver"
        socket =  @connection.socket
        
        puts socket
        
        while command = socket.gets  do
          params = command.split "||"
          instruction = params.shift
          exec_command instruction, params
        end
      end


      private
      def exec_command command, params
        if command === PROTOCOL["SIGNIN"]
          exec_signin params
        elsif command === PROTOCOL["SIGNUP"]
          exec_signup params
        elsif command === PROTOCOL["ENTER_SQUARE"]
          exec_enter_square
        end

      end

      def exec_signup params
        nickname, password = params[0], params[1]          
        @connection.signup( nickname, password )        
      end

      def exec_signin params
        nickname, password = params[0], params[1]          
        @connection.signin( nickname, password )
      end

      def exec_enter_square
        
      end

      def exec_invite_play_game

      end

      def exec_accept_play_game

      end
      
      def exec_action_gawibawibo
      
      end

      def exec_get_match_ground

      end

      def exec_get_fame_hall

      end

    end
  end
end
