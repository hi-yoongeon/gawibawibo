require "digest/sha1"

module Gawibawibo
  module Database
    module Model
      class User
        attr_accessor :id, :username, :win_count, :lose_count, :draw_count, :signin_count, :match_count, :signin_datetime, :signup_datetime, :wining_rate

        def initialize( *args )        
          @username = args[0] unless args[0].nil?
          @password = hashed args[1] unless args[1].nil?
        end
        
        def password
          @password
        end

        def password= password
          @password = hashed password
        end

        def hashed password
          Digest::SHA1.hexdigest( password )
        end

        def to_json
          require "json"
          { 
            "id" => @id,
            "username" => @username,
            "win_count" => @win_count,
            "lose_count" => @lose_count,
            "draw_count" => @draw_count,
            "signin_count" => @signin_count,
            "match_count" => @match_count,
            "signin_datetime" => @signin_datetime,
            "signup_datetime" => @signin_datetime,
            "wining_rate" => @wining_rate
          }.to_json
        end

      end    
    end
  end
end
