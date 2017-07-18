require_relative 'gpio.rb'

class Led
	ON = '1'
	OFF = '0'

	def initialize(pin)
		@pin = pin
	end

	def turn_on
		GPIO.gpio_set_value(@pin, ON)
	end

	def turn_off
		GPIO.gpio_set_value(@pin, OFF)
	end
end
