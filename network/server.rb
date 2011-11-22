# -*- coding: utf-8 -*-
require "socket"
require "singleton"
require "network/network_const"
require "network/connection"


module Gawibawibo
  module Network
    class Server      
      include Singleton

      def initialize
        
        @connections = []
        
        puts "Creating server.."
        @server = TCPServer.new( NetworkConst::HOSTNAME, NetworkConst::PORT )
      end

      def start
        puts "Starting server"
        
        loop do
          Thread.start(@server.accept) do |s|
            create_connection s, self
          end
        end

      end


      private
      def create_connection( socket, server )
        connection = Connection.new( socket, server )
        @connections << connection
      end
        
      
    end
  end
end
