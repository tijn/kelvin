module Kelvin
  class Parser
    def initialize(@string : String)
    end

    # Returns a new Temperature for the given `string`
    #
    # For example:
    # ```
    # Kelvin::Parser.parse("22.3 °C")
    # Kelvin::Parser.parse("82.10 °F")
    # Kelvin::Parser.parse("273.15 K")
    # ```
    def self.parse(string : String)
      new(string).parse
    end

    # :nodoc
    def parse
      string = @string.strip.delete(' ')
      if string.ends_with? "°C"
        number = string.rchop.rchop
        Temperature.celcius(number.to_f)
      elsif string.ends_with? "°F"
        number = string.rchop.rchop
        Temperature.fahrenheit(number.to_f)
      elsif string.ends_with? "K"
        number = string.rchop
        Temperature.new(number.to_f)
      else
        raise "Cannot parse #{string}"
      end
    end
  end
end
