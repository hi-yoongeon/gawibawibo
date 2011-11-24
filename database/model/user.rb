require "digest/sha1"

module Gawibawibo
  module Database
    module Model
      class User
        attr_accessor :username

        def initialize( *args )        
          @username = args[0]
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

      end    
    end
  end
end
