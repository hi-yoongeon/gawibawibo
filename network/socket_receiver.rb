module Gawibawibo
  module Network
    class SocketReceiver
      def initialize conn
        @connection = conn
      end

      def listen
        while command = @connection.socket.gets
          puts "#{@socket.id} : #{command}"
          params = command.split "||"
          instruction = params.split

          exec_command instruction, params

        end
      end

    end
  end
end
