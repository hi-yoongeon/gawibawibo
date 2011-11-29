module Gawibawibo
  module Network
    module NetworkConst
      HOSTNAME = "localhost"
      PORT = 2002
      TIMEOUT = 30
      GAWIBAWIBO_ACTION = {
        "GAWI" => "GAWI",
        "BAWI" => "BAWI",
        "BO" => "BO"
      }
      PROTOCOL = {
        "CONNECTION_OK" => "CONNECTION_OK",
        "SIGNIN" => "SIGNIN",
        "SIGNIN_SUCCESS" => "SIGNIN_SUCCESS",
        "SIGNIN_FAILURE" => "SIGNIN_FAILURE",
        "SIGNUP" => "SIGNUP",
        "SIGNUP_SUCCESS" => "SIGNUP_SUCCESS",
        "SIGNUP_FAILURE" => "SIGNUP_FAILURE",        
        "ENTER_SQUARE" => "ENTER_SQUARE",
        "ENTERED_SQUARE" => "ENTERED_SQUARE",
        "REFRESHED_SQUARE" => "REFRESHED_SQUARE",
        "INVITE_PLAY_GAME" => "INVITE_PLAY_GAME",
        "INVITED_PLAY_GAME" => "INVITED_PLAY_GAME",
        "ACCEPT_PLAY_GAME" => "ACCEPT_PLAY_GAME",
        "START_GAME" => "START_GAME",
        "ACTION_GAWIBAWIBO" => "ACTION_GAWIBAWIBO",
        "GAME_RESULT" => "GAME_RESULT",
        "GET_SQUARE_INFO" => "GET_SQUARE_INFO",
        "SQUARE_INFO" => "SQUARE_INFO",
        "MATCH_GROUND_INFO" => "MATCH_GROUND_INFO",
        "GET_FAME_HALL" => "GET_FAME_HALL",
        "FAME_HALL_INFO" => "FAME_HALL_INFO",
        "MESSAGE" => "MESSAGE"
      }
      
    end
  end
end
