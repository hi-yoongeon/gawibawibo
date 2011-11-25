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
        while command = socket.gets  do
          params = command.chop.split "||"
          instruction = params.shift
          exec_command instruction, params
        end
      end


      private
      def exec_command (*args)
        command = args[0]
        params = args[1] if args.size > 1

        if command === PROTOCOL["SIGNIN"]
          exec_signin params
        elsif command === PROTOCOL["SIGNUP"]
          exec_signup params
        elsif command === PROTOCOL["ENTER_SQUARE"]
          exec_enter_square
        elsif command === PROTOCOL["INVITE_PLAY_GAME"]
          exec_invite_play_game params[0]
        elsif command === PROTOCOL["ACCEPT_PLAY_GAME"]
          exec_accept_play_game params[0]
        elsif command === PROTOCOL["ACTION_GAWIBAWIBO"]
          exec_action_gawibawibo params[0]
        elsif command === PROTOCOL["GET_MATCH_GROUND"]
          exec_get_match_ground
        elsif command === PROTOCOL["GET_FAME_HALL"]
          exec_get_fame_hall
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
        @connection.user.game_controller.enter_square
      end

      def exec_invite_play_game username
        @connection.user.game_controller.invite_play_game username
      end

      def exec_accept_play_game username
        @connection.user.game_controller.accept_play_game username
      end
      
      def exec_action_gawibawibo type
        @connection.user.game_controller.action_gawibawibo type
      end

      def exec_get_match_ground
        @connection.get_match_ground
      end

      def exec_get_fame_hall

      end

    end
  end
end
