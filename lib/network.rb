require 'net/http'
require 'uri'
require 'open-uri'

class Network
  def connected?
    begin
      true if open("http://www.google.com/")
    rescue
      false
    end
  end
end
