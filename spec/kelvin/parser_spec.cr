require "spec"

describe Kelvin::Parser do
  it "ignores spaces" do
    Kelvin::Parser.parse("10°C").should eq(Kelvin::Temperature.celcius(10.0))
    Kelvin::Parser.parse("  10    °C  ").should eq(Kelvin::Temperature.celcius(10.0))
    Kelvin::Parser.parse("  10.0000    °F  ").should eq(Kelvin::Temperature.fahrenheit(10.0))
  end

  it "can parse our own output" do
    one = Kelvin::Temperature.boiling_point
    two = Kelvin::Parser.parse(one.to_s)
    two.to_f.should be_close(one.to_f, 0.1)
  end

  describe "parsing evil strings designed to break it" do
    it "does not parse strings with double °-signs" do
      expect_raises(ArgumentError) do
        Kelvin::Parser.parse("10°°F")
      end
    end

    it "does not parse strings with double signs" do
      expect_raises(ArgumentError) do
        Kelvin::Parser.parse("10 °F°F")
      end

      expect_raises(ArgumentError) do
        Kelvin::Parser.parse("10 °C°C")
      end
    end
  end
end
