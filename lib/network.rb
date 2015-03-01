require 'open-uri'

class Network
  def connected?
    begin
     	open("http://www.google.com/", read_timeout:3)
     	true
    rescue => e
    	puts e.message
      false
    end
  end
end

