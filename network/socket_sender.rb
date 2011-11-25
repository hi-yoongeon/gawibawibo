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

      def send_entered_square match_ground_list
        write NetworkConst::PROTOCOL["ENTERED_SQUARE"] + "||" + match_ground_list
      end

      def send_refreshed_square match_ground_list
        write NetworkConst::PROTOCOL["REFRESHED_SQUARE"] + "||" + match_ground_list
      end

      def send_invited_play_game his_username
        write NetworkConst::PROTOCOL["INVITED_PLAY_GAME"] + "||" + his_username
      end

      def send_start_game
        write NetworkConst::PROTOCOL["START_GAME"]
      end

      def send_game_result result
        write NetworkConst::PROTOCOL["GAME_RESULT"] + "||" + result
      end

      def send_match_ground_info match_ground_list
        write NetworkConst::PROTOCOL["MATCH_GROUND_INFO"] + "||" + match_ground_list
      end

      def send_fame_hall_info fame_hall_info
        write NetworkConst::PROTOCOL["FAME_HALL_INFO"] + "||" + fame_hall_info
      end

    end
  end
end
