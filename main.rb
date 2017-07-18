require 'lib/gate'


GPIO.export(60)
GPIO.gpio_set_direction(60, 'in')

gate = Gate.new(60)

loop do
	gate.update_status
	sleep 0.5
end
