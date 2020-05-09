describe Kelvin::Temperature do
  describe ".new" do
    it "can be initialized with an integer" do
      one = Kelvin::Temperature.new(1)
      one.to_f.should be_close(1.0, 0.0001)
    end
  end

  describe "#to_celcius" do
    it "knows 0 K is -273.15 °C" do
      zero = Kelvin::Temperature.zero
      zero.to_celcius.should be_close(-273.15, 0.0001)
    end
  end

  describe "#to_fahrenheit" do
    it "knows 0 K is -459.67 °F" do
      zero = Kelvin::Temperature.zero
      zero.to_fahrenheit.should be_close(-459.67, 0.0001)
    end
  end

  describe "#to_s" do
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

  describe "#+" do
    it "sums the two temperatures in Kelvin" do
      sum = Kelvin::Temperature.parse("10 °C") + Kelvin::Temperature.parse("20 °C")
      sum.to_f.should be_close(576.3, 0.0001) # 576.3 K ~ 303.2 °C
    end

    it "sums the two temperatures in Kelvin" do
      sum = Kelvin::Temperature.parse("10 °C") + Kelvin::Temperature.parse("20 K")
      sum.to_f.should be_close(303.15, 0.0001) # 303.15 K ~ 30 °C
    end
  end

  describe "#-" do
    it "subtracts the two temperatures in Kelvin" do
      sum = Kelvin::Temperature.parse("10 °C") - Kelvin::Temperature.parse("1 K")
      sum.to_f.should be_close(282.15, 0.0001)
    end
  end

  describe "#*" do
    it "multiplies the temperatures (in Kelvin)" do
      product = Kelvin::Temperature.parse("10 °C") * 2
      product.to_f.should be_close(566.3, 0.0001) # 566.3 ~ 2 * 283.15
    end
  end

  describe "#/" do
    it "divides the temperatures (in Kelvin)" do
      product = Kelvin::Temperature.parse("10 °C") / 2
      product.to_f.should be_close(141.575, 0.0001) # 141.575 ~ 283.15 / 2
    end
  end
end
