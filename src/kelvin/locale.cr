module Kelvin
  # The Locale defines if temperatures should be displayed in °C or °F.
  class Locale
    FAHRENHEIT_LOCALES = ["_US", "_BZ"]

    # Returns true if the current locale suggests that degrees Fahrenheit should be used.
    #
    # Only a few countries use Fahrenheit as their official scale: the United States, Belize, Palau, and the
    # British Territories of the Bahamas and the Cayman Islands. Note that even though Liberia and Myanmar use
    # imperial measurements they use °C for temperature.
    #
    # For some purposes (cooking) °F is still widely used in Canada and other places. This method cannot know
    # your purpose so it will ignore that.
    def self.fahrenheit?
      FAHRENHEIT_LOCALES.any? { |code| locale.includes?(code) }
    end

    # Returns true if the current locale suggests that degrees Celcius should be used.
    #
    # The opposite `#fahrenheit?`
    def self.celcius?
      !fahrenheit?
    end

    # returns the locale that we use to determine the preferred temperature scale.
    def self.locale
      ENV["LC_MEASUREMENT"]? || ENV["LC_ALL"]? || "C"
    end
  end
end
