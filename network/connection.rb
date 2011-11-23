# -*- coding: utf-8 -*-

require "network/socket_sender"
require "network/socket_receiver"
require "network/network_const"
require "network/authentication"
require "model/user"

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
        @sender.write NetworkConst::PROTOCOL["CONNECTION_OK"]
      end

      def auth
        @auth
      end

      def signin( username, password )
        user = Model::User.new username, password
        @user = auth.signin user

        if @user.nil?
          @sender.send_signin_failure
        else
          @sender.send_signin_success
        end

      end
      
      def signup( username, password )
        user = Model::User.new username, password
        if auth.exist_user? user
          @sender.send_signup_failure
        else
          auth.signup user
          @sender.send_signup_success
        end
      end
      
      def close

      end

    end
  end
end
