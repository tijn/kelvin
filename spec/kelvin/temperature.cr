describe Kelvin::Temperature do
  it "knows 0 K is -273.15 °C" do
    zero = Kelvin::Temperature.zero
    zero.to_celcius.should eq(-273.15)
  end

  it "knows 0 K is -459.67 °F" do
    zero = Kelvin::Temperature.zero
    zero.to_fahrenheit.should eq(-459.67)
  end

  it "can show itself in degrees Celcius" do
    zero = Kelvin::Temperature.new
    ENV["LC_MEASUREMENT"] = "nl_NL.utf8"
    zero.to_s.should eq("-273.2 °C")
  end

  it "can show itself in Fahrenheit" do
    zero = Kelvin::Temperature.new
    ENV["LC_MEASUREMENT"] = "en_US.utf8"
    zero.to_s.should eq("-459.7 °F")
  end
end
