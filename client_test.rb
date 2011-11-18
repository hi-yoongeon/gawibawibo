# -*- coding: utf-8 -*-

if __FILE__ == $0

  require "socket"
  socket = TCPSocket.new( "localhost" , 2002)


  Thread.start(socket) do |s|
    while msg = s.gets
      puts msg.chop
    end
  end
  

  loop do
    print "명령을 입력하세요 => "
    socket.puts gets
  end

end
