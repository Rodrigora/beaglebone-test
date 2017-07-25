require_relative 'lib/gate.rb'
require_relative 'lib/led.rb'

GATE_GPIO = 60
GATE_LED_GPIO = 67
NET_ACCESS_LED = 48

gate = 						Gate.new(GATE_GPIO)
gate_led = 				Led.new(GATE_LED_GPIO)
connection_led = 	Led.new(NET_ACCESS_LED)
network = 				Network.new
count = 					0

loop do
	gate.update_status

	if gate.open?
    gate_led.turn_on
  else
		gate_led.turn_off
	end

	if count.zero? && network.connected?
		connection_led.turn_on
	else
		connection_led.turn_off
	end

	sleep 0.1
	count += 1
	count = 0 if count == 100
end
