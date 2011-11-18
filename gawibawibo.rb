require "singleton"
require "network/server"
require "game/square"
require "game/user"


module Gawibawibo
  VERSION = "0.1"

  class MainController
    include Singleton
    
    def initialize
      # @squre = Game::Squre.instance
      # puts Network::Server.methods
      @server = Network::Server.instance
    end

    def start_server
      @server.start
    end
    
    def create_user( socket )
      
      conection = Game::Connection.new socket
      


    end
    
  end


end
