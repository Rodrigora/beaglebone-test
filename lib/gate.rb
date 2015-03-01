require_relative 'gpio.rb'
require "net/http"
require "uri"
require 'timeout'

class Gate
	TOKEN = 'c751f6cc075b05cf58a39b9a7a21a1e095ec36ba08c241cde4aae77feadf59bc'

	OPEN = '0'
	CLOSED = '1'

	def initialize(pin)
		GPIO.export(pin)
		GPIO.gpio_set_direction(pin, 'in')
		@pin = pin
		@last_status = nil
	end

	def current_status
		GPIO.gpio_get_value(@pin)
	end

	def update_status
		status = current_status

		return status if status == @last_status

		@last_status = status

		puts "Updating status: #{status}"

		uri = URI.parse("http://motelm.herokuapp.com/api/v1/gates/status?gate_status=#{status}")
		http = Net::HTTP.new(uri.host, uri.port)
		http.read_timeout = 3

		request = Net::HTTP::Post.new(uri.request_uri)
		request['Authorization'] = TOKEN

		puts 'before'
		http.request(request)
		puts 'after'

		status
       		rescue
		puts 'rescue'
		status
	end

	def open?
		@last_status.strip == OPEN
	end
end


