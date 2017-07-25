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

	def self.gpio_set_value(gpio_number, value)
		value_file_path = SYSFS_GPIO_DIR + "/gpio#{gpio_number}/value"

		File.open(value_file_path, 'w') do |file|
			file.write(value)
		end
	end

	def self.gpio_set_direction(gpio_number, direction)
		direction_file_path = SYSFS_GPIO_DIR + "/gpio#{gpio_number}/direction"

		File.open(direction_file_path, 'w') do |file|
			file.write(direction)
		end
	end
end

