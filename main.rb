require_relative 'lib/gate.rb'
require_relative 'lib/led.rb'

GATE_GPIO = 60
GATE_LED_GPIO = 51

GPIO.export(GATE_GPIO)
GPIO.export(GATE_LED_GPIO)

GPIO.gpio_set_direction(GATE_GPIO, 'in')
GPIO.gpio_set_direction(GATE_LED_GPIO, 'out')

gate = Gate.new(GATE_GPIO)
led = Led.new(GATE_LED_GPIO)

loop do
	gate.update_status

	if gate.open?
		led.turn_on
	else
		led.turn_off
	end

	sleep 0.1
end
