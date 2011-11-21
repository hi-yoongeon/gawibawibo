$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include? File.dirname(__FILE__)


require "singleton"
require "network/server"
require "network/connection"
require "game/square"
require "game/user"


module Gawibawibo
  VERSION = "0.1"

  class MainController
    include Singleton
    
    def initialize
      # @squre = Game::Squre.instance
      @server = Network::Server.instance
    end

    def start_server
      @server.start
    end
    
    def create_connection( socket )
      connection = Network::Connection.new socket
      connection.start
    end

    def exec_command( instruction, params )
      
    end
    
  end


end




if __FILE__ == $0

  gawi = Gawibawibo::MainController.instance
  gawi.start_server

  

end
