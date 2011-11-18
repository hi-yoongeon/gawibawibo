$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include? File.dirname(__FILE__)

require "gawibawibo"

if __FILE__ == $0

  gawi = Gawibawibo::MainController.instance
  
  gawi.start_server

  

end
