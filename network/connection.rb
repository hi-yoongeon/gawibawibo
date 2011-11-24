# -*- coding: utf-8 -*-

require "network/socket_sender"
require "network/socket_receiver"
require "network/authentication"


module Gawibawibo
  module Network
    class Connection

      attr_accessor :socket, :server, :sender, :receiver

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

      def auth
        @auth
      end

      def signin( username, password )
        result = @auth.signin username, password

        if result.nil?
          @sender.send_signin_failure
        else
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
      
      def close

      end

    end
  end
end
