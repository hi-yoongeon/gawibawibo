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
      
      def create_model( result )
        @model = Database::Model::User.new()
        @model.id = result["id"]
        @model.username = result["username"]
        @model.win_count = result["win_count"]
        @model.lose_count = result["lose_count"]
        @model.draw_count = result["draw_count"]
        @model.signin_count = result["signin_count"]
        @model.match_count = result["match_count"]
        @model.signin_datetime = result["signin_datetime"]
        @model.signup_datetime = result["signup_datetime"]
        @model.wining_rate = result["wining_rate"]
      end
      
    end
  end
end
