require_relative 'gpio.rb'

class Led
  ON = '1'
  OFF = '0'

  def initialize(pin)
    GPIO.export(pin)
    GPIO.gpio_set_direction(pin, 'out')
    @pin = pin
    @status = nil
  end

  def turn_on
    GPIO.gpio_set_value(@pin, ON)
    @status = ON
  end

  def turn_off
    GPIO.gpio_set_value(@pin, OFF)
    @status = OFF
  end

  def on?
    @status == ON
  end
end
