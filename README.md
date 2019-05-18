# Kelvin

[![Build Status](https://travis-ci.org/tijn/kelvin.svg?branch=master)](https://travis-ci.org/tijn/kelvin)

A small library for handling temperatures.

It's as precise as a 64 bit Float.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  kelvin:
    github: tijn/kelvin
```

## Usage

```crystal
require "kelvin"

temperature = Kelvin::Temperature.celcius(22.3)
puts temperature
# => "22.3 °C" : String
# or if you're in the US, it will output: "72.1 °F" : String
# It follows the LOCALE settings on your system.

puts temperature.to_kelvin
# => 295.45
```

It can also parse text:

```crystal
require "kelvin"

temperature = Kelvin::Temperature.parse("22.3 °C")
puts temperature
# => "22.3 °C" : String
```

and you can use it to compare temperatures on different scales.

```crystal
temperature_in_paris = Kelvin::Temperature.parse("22.3 °C")
temperature_in_boston = Kelvin::Temperature.parse("70.1 °F")

city = (temperature_in_paris > temperature_in_boston) ? "Paris" : "Boston"
puts "#{city} is warmer today"
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/tijn/kelvin/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [tijn](https://github.com/tijn) Tijn Schuurmans - creator, maintainer
