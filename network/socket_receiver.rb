require "network/network_const"

module Gawibawibo
  module Network
    class SocketReceiver
      def initialize conn
        @connection = conn
      end

      def listen
        puts "called receiver"
        socket =  @connection.socket
        
        puts socket
        
        while command = socket.gets  do
          # puts "#{socket} : #{command}"
          params = command.split "||"
          instruction = params.shift
          exec_command instruction, params
        end
      end


      private
      def exec_command instruction, params

        puts "exec_command #{instruction}"
         
        if instruction === NetworkConst::PROTOCOL["SIGNIN"]
          puts "Signin"
          nickname, password = params[0], params[1]          
          @connection.signin( nickname, password )
        elsif instruction === NetworkConst::PROTOCOL["SIGNUP"]
          nickname, password = params[0], params[1]          
          @connection.signup( nickname, password )
        end

      end
      
      

    end
  end
end