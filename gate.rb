require "net/http"
require "uri"

SYSFS_GPIO_DIR = "/sys/class/gpio"

class GPIO

	def self.export(gpio_number)
		File.open(SYSFS_GPIO_DIR + '/export', 'w') do |file|
			file.write(gpio_number)
		end
	end

	def self.gpio_get_value(gpio_number)
		value_file_path = SYSFS_GPIO_DIR + "/gpio#{gpio_number}/value"
		File.read(value_file_path)
	end

	def self.gpio_set_direction(gpio_number, direction)
		direction_file_path = SYSFS_GPIO_DIR + "/gpio#{gpio_number}/direction"

		File.open(direction_file_path, 'w') do |file|
			file.write(direction)
		end
	end
end

class Gate
	PIN = 60

	OPEN = '1'
	CLOSED = '0'

	def current_status
		GPIO.gpio_get_value(PIN)
	end

	def update_status
		status = current_status

		puts "Updating status: #{status}"

		uri = URI.parse("http://motelm.herokuapp.com/api/v1/")
		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Post.new(uri.request_uri)
		request.set_form_data({"gate_status" => status})

		http.request(request)
	end
end

GPIO.export(60)
GPIO.gpio_set_direction(60, 'in')

gate = Gate.new
loop do
	gate.update_status
	sleep 1
end