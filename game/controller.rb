# -*- coding: utf-8 -*-
module Gawibawibo
  module Game
    class Controller
      def initialize( user )
        @user = user
      end

      # 대기실 들어가기
      def enter_square
        Square.instance.enter @user
        @user.connection.entered_square
      end

      # 대기실 나오기
      def exit_square

      end

      # 매치 그라운드 만들기
      def create_match_ground

      end
      
      # 매치 그라운드 입장
      def enter_match_ground

      end

      # 매치 그라운드 떠나기
      def exit_match_ground
        
      end

      # 게임 초대하기
      def invite_play_game username
        
      end

      # 가위바위보 내기
      def action_gawibawibo type 

      end

      # 게임 수락
      def accept_play_name username

      end

      #접속 종료
      def quit
        
      end

    end
  end
end
