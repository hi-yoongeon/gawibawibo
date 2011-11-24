require "network/network_const"

module Gawibawibo
  module Network
    class SocketSender

      def initialize conn
        @connection = conn
      end

      def write protocol
        @connection.socket.puts protocol
      end
      
      def send_message message
        write NetworkConst::PROTOCOL["MESSAGE"] + "||" + message
      end

      def send_connection_ok
        write NetworkConst::PROTOCOL["CONNECTION_OK"]
      end

      def send_signin_success
        write NetworkConst::PROTOCOL["SIGNIN_SUCCESS"]
      end

      def send_signin_failure
        write NetworkConst::PROTOCOL["SIGNIN_FAILURE"]        
      end

      def send_signup_success
        write NetworkConst::PROTOCOL["SIGNUP_SUCCESS"]
      end

      def send_signup_failure
        write NetworkConst::PROTOCOL["SIGNUP_FAILURE"]        
      end

      def send_entered_square
        write NetworkConst::PROTOCOL["ENTERED_SQUARE"]
      end

      def send_refreshed_square
        write NetworkConst::PROTOCOL["REFRESHED_SQUARE"]
      end

      def send_requested_play_game
        write NetworkConst::PROTOCOL["REQUESTED_PLAY_GAME"]
      end

      def send_start_game
        write NetworkConst::PROTOCOL["START_GAME"]
      end

      def send_game_result result
        write NetworkConst::PROTOCOL["GAME_RESULT"] + "||" + result
      end

      def send_square_info json_data
        write NetworkConst::PROTOCOL["SQUARE_INFO"] + "||" + json_data
      end

      def send_fame_hall_info json_data
        write NetworkConst::PROTOCOL["FAME_HALL_INFO"] + "||" + json_data
      end

    end
  end
end
