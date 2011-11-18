module Gawibawibo
  module Network
    class Connection

      attr_accessor :socket

      def initialize socket
        @socket = socket
        @sender = SocketSender.new self
        @receiver = SocketReceiver.new self
      end

      def login
        
      end

      def close

      end

    end
  end
end
