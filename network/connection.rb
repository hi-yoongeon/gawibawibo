require "network/socket_sender"
require "network/socket_receiver"

module Gawibawibo
  module Network
    class Connection

      attr_accessor :socket

      def initialize( socket )
        self.socket = socket
        @sender = SocketSender.new self
        @receiver = SocketReceiver.new self
      end

      def start
        
        @receiver.listen
        puts "Started connection"
      end

      def login
        
      end

      def close

      end

    end
  end
end
