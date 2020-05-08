require "spec"

describe Kelvin::Parser do
  it "ignores spaces" do
    Kelvin::Parser.parse("10°C").should eq(Kelvin::Temperature.celcius(10.0))
    Kelvin::Parser.parse("  10    °C  ").should eq(Kelvin::Temperature.celcius(10.0))
    Kelvin::Parser.parse("  10.0000    °F  ").should eq(Kelvin::Temperature.fahrenheit(10.0))
  end

  it "can parse our own output" do
    Kelvin::Parser.parse(Kelvin::Temperature.boiling_point.to_s).should eq(Kelvin::Temperature.boiling_point)
  end

  it "does not parse 10°°F" do
    expect_raises(ArgumentError) do
      Kelvin::Parser.parse("10°°F")
    end
  end
end
