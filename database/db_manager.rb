require "sqlite3"
require "singleton"

module Gawibawibo
  module Database
    DB_FILE = "resources/gawibawibo.db"
    TABLE_USER = "users"
    TABLE_MATCH_LOG = "match_logs"

    class DBManager
      include Singleton
      def initialize
        @db_conn = SQLite3::Database.open DB_FILE
        @db_conn.results_as_hash = true
      end

      def exist_user? user
        @db_conn.query("SELECT * FROM #{TABLE_USER} WHERE username = '#{user.username}'").any?
      end

      def signup user
        @db_conn.query "INSERT INTO #{TABLE_USER} (username, password, win_count, lose_count, draw_count, signin_count, match_count, wining_rate, signup_datetime) VALUES('#{user.username}', '#{user.password}', 0, 0, 0, 0, 0, 0, datetime())"
      end

      def signin user
        row = @db_conn.query("SELECT * FROM #{TABLE_USER} WHERE username = '#{user.username}' AND password = '#{user.password}'").first
        sql = "UPDATE #{TABLE_USER} SET signin_count = signin_count + 1, signin_datetime = datetime() WHERE username = '#{user.username}'"
        @db_conn.query(sql) unless row.nil?
        row
      end

      def win_game user
        @db_conn.query "UPDATE #{TABLE_USER} SET win_count = win_count + 1, match_count = match_count +1 WHERE username = '#{user.username}'"
      end

      def lose_game user
        @db_conn.query "UPDATE #{TABLE_USER} SET lose_count = lose_count + 1, match_count = match_count +1 WHERE username = '#{user.username}'"
      end

      def draw_game user
        @db_conn.query "UPDATE #{TABLE_USER} SET draw_count = draw_count + 1, match_count = match_count +1 WHERE username = '#{user.username}'"
      end

      def calculate_wining_rate user
        @db_conn.query("SELECT match_count, win_count FROM #{TABLE_USER} WHERE username = '#{user.username}'").first do | row |
          match_count = row["match_count"]
          win_count = row["win_count"]

          if win_count > 0
            wining_rate = (( win_count.to_f / match_count.to_f ) * 100).round(2)
            @db_conn.query "UPDATE #{TABLE_USER} SET wining_rate = #{wining_rate} WHERE username = '#{user.usernmae}'"
          end

        end
      end

      def insert_match_log game_room
        @db_conn.query "INSERT INTO #{TABLE_MATCH_LOG} 
                          (host_user_id, guest_user_id, winner_user_id, loser_user_id, is_draw, match_datetime) 
                       VALUES
                          (#{game_room.host.id}, #{game_room.guest.id}, #{game_room.winner.id}, #{game_room.loser.id}, #{game_room.draw?}, datetime() )"
      end

      def DBManager::create_table_users
        db = SQLite3::Database.open DB_FILE
        sql = "create table IF NOT EXISTS #{TABLE_USER}" + 
          "(" +
          "id  INTEGER  PRIMARY KEY  AUTOINCREMENT, " + 
          "username   TEXT   not null, " + 
          "password    TEXT    not null, " + 
          "win_count   NUMERIC not null, " +
          "lose_count   NUMERIC  not null, " +
          "draw_count   NUMERIC  not null, " + 
          "signin_count   NUMERIC  not null, " + 
          "match_count   NUMERIC  not null, " +
          "signin_datetime   DATETIME  null, " +
          "signup_datetime   DATETIME  not null, " +
          "wining_rate   REAL  not null "+
          ")"
        db.query sql
      end
      
      def DBManager::create_table_match_logs
        db = SQLite3::Database.open DB_FILE
        sql = "create table IF NOT EXISTS #{TABLE_MATCH_LOG}" +
          "(" +
          "id  INTEGER  PRIMARY KEY  AUTOINCREMENT, " +
          "host_user_id   NUMERIC  not null, " + 
          "guest_user_id   NUMERIC  not null, " +
          "winner_user_id   NUMERIC  null, " + 
          "loser_user_id   NUMERIC  null, " + 
          "is_draw   TEXT not null, " +
          "match_datetime   DATETIME not null"+
          ")"
        db.query sql
      end

      def DBManager::truncate_table_users
        db = SQLite3::Database.open DB_FILE
        db.query "drop table #{TABLE_USER}"
        DBManager::create_table_users
      end

      def DBManager::truncate_table_match_logs
        db = SQLite3::Database.open DB_FILE
        db.query "drop table #{TABLE_MATCH_LOG}"
        DBManager::create_table_match_logs
      end

    end
  end
end
