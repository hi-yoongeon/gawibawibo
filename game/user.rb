require "game/controller"

module Gawibawibo
  module Game
    class User

      attr_accessor :model
      attr_reader :connection, :game_controller

      def initialize( conn )
        @connection = conn
        @game_controller = Controller.new self
      end
      
      
      
    end
  end
end
