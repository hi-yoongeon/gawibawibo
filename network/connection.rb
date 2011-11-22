# -*- coding: utf-8 -*-

require "network/socket_sender"
require "network/socket_receiver"
require "network/network_const"
require "database/db_connection"

module Gawibawibo
  module Network
    class Connection

      attr_accessor :socket, :server, :sender, :receiver

      def initialize( socket, server )
        @socket = socket
        @server = server
        @sender = SocketSender.new self
        @receiver = SocketReceiver.new self
        
        start
      end

      def start
        @receiver.listen
        @sender.write NetworkConst::PROTOCOL["CONNECTION_OK"]
      end

      def signin( nickname, password )
        
      end
      
      def signup( nickname, password )
        db_conn = Database::DBConnection.instance
        
        
      end
      
      def close

      end

    end
  end
end
