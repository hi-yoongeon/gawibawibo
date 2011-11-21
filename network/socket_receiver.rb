module Gawibawibo
  module Network
    class SocketReceiver
      def initialize conn
        @connection = conn
      end

      def listen
        puts "called receiver"
        socket =  @connection.socket

        while command = socket.gets  do
          # puts "#{socket} : #{command}"
          params = command.split "||"
          instruction = params.shift
          exec_command instruction, params
        end
      end


      private
      def exec_command instruction, params

        unless instruction == "LOGIN"
          main = MainController.instance
          main.exec_command instruction, params
        end

      end
      
      

    end
  end
end
