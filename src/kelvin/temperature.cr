module Kelvin
  class Temperature
    include Comparable(Temperature)

    # Initializes a new `Temperature` with the given value in Kelvin.
    # The default is 0 K, which corresponds with -273.15 °C.
    def initialize(@kelvin : Float = 0.0)
    end

    def self.new(kelvin)
      new(kelvin.to_f)
    end

    # Make a new `Temperature` using a reading in degrees Celcius.
    def self.celcius(degrees_celcius : Float)
      new(degrees_celcius + 273.15)
    end

    # Make a new `Temperature` using a reading in degrees Fahrenheit.
    def self.fahrenheit(degrees_fahrenheit : Float)
      new((degrees_fahrenheit + 459.67) * 5.0 / 9.0)
    end

    # The boiling point of water (under precisely defined circumstances); 100 °C
    def self.boiling_point
      celcius(100.0)
    end

    # The freezing point of water
    def self.freezing_point
      celcius(0.0)
    end

    # absolute zero. -273.15 °C.
    def self.zero
      new
    end

    # Returns a new `Temperature` by parsing *string*.
    #
    # For example:
    # ```
    # Kelvin::Temperature.parse("22.3 °C")
    # Kelvin::Temperature.parse("82.10 °F")
    # Kelvin::Temperature.parse("273.15 K")
    # ```
    def self.parse(string : String)
      Parser.parse(string)
    end

    # Returns a `Float` with the temperature in Kelvin
    def to_f
      @kelvin
    end

    # Returns a `Float` with the temperature in Kelvin
    def to_kelvin
      @kelvin
    end

    # Returns a `Float` with the temperature in degrees Celcius
    def to_celcius
      @kelvin - 273.15
    end

    # Returns a `Float` with the temperature in degrees Fahrenheit
    def to_fahrenheit
      @kelvin * 9.0 / 5.0 - 459.67
    end

    # Output the temperature in the scale that's default for the current locale settings.
    def to_s(io)
      if Locale.celcius?
        io << to_celcius.round(1) << " °C"
      else
        io << to_fahrenheit.round(1) << " °F"
      end
    end

    # Compare two temperatures
    def <=>(other)
      to_f <=> other.to_f
    end

    # Sum two temperatures.
    # Note that the outcome may be very different from what you might expect:
    # ```
    # Temperature.parse("10 °C") + Temperature.parse("20 °C") # => 303.2 °C
    # ```
    # The reason for this is that its only meaningful to add or subtract temperatures in Kelvin.
    def +(other)
      build_new(to_f + other.to_f)
    end

    # Subtract *other* from `self`. Returns a new Temperature. The remarks for `+` apply here too.
    def -(other)
      self.+(-other.to_f)
    end

    # Multiply the temperature by a factor.
    # Note that the outcome may be very different from what you might expect:
    # ```
    # Temperature.parse("10 °C") * 2 # => XXXX
    # ```
    #
    def *(factor)
      build_new(to_f * factor.to_f)
    end

    # Subtract *other* from `self`. Returns a new Temperature. The remarks for `+` apply here too.
    def /(divisor)
      build_new(to_f / divisor.to_f)
    end

    private def build_new(temperature)
      self.class.new(temperature)
    end
  end
end
