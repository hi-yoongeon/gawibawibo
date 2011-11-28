# -*- coding: utf-8 -*-

require "network/socket_sender"
require "network/socket_receiver"
require "network/authentication"


module Gawibawibo
  module Network
    class Connection

      attr_accessor :socket, :server, :sender, :receiver
      attr_reader :auth, :user

      def initialize( socket, server )
        @socket = socket
        @server = server
        @sender = SocketSender.new self
        @receiver = SocketReceiver.new self
        @auth = Authentication.new
        start
      end

      def start
        @receiver.listen
        @sender.send_connection_ok
      end

      def signin( username, password )
        result = @auth.signin username, password

        if result.nil?
          @sender.send_signin_failure
        else
          @user = MainController.instance.create_user self
          @user.create_model result
          @sender.send_signin_success
        end
      end
      
      def signup( username, password )
        is_success = @auth.signup username, password

        if is_success
          @sender.send_signup_failure
        else
          @sender.send_signup_success
        end
      end

      def get_match_ground
        @sender.send_match_ground_info match_ground_json_str
      end

      def entered_square
        @sender.send_entered_square match_ground_json_str
      end

      def invited_play_game username
        @sender.send_invited_play_game username
      end
      
      def close

      end


      private
      def match_ground_json_str
        Game::Square.instance.joined_user_list
      end

    end
  end
end
