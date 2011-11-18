require "network/network_const"

module Gawibawibo
  module Network
    class SocketSender

      def initialize conn
        @connection = conn
      end

      def send_connection_ok
        @connection.socket.puts NetworkConst::CONNECTION_OK
      end

      def send_login_success

      end

      def send_login_failure

      end

      def send_entered_square
        
      end

      def send_refreshed_square

      end

      def send_requested_play_game

      end

      def send_start_game

      end

      def send_game_result

      end

      def send_square_info

      end

      def send_fame_hall
        
      end

    end
  end
end
