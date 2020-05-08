require "spec"

describe Kelvin::Locale do
  describe ".locale" do
    it "returns a locale value" do
      ENV["LC_MEASUREMENT"] = "nl_NL.utf8"
      locale_string = Kelvin::Locale.locale
      locale_string.should be_a(String)
      locale_string.should eq("nl_NL.utf8")
    end
  end

  describe ".fahrenheit?" do
    it "only returns true for the US and Belize" do
      ENV["LC_MEASUREMENT"] = "nl_NL.utf8"
      Kelvin::Locale.fahrenheit?.should eq(false)

      ENV["LC_MEASUREMENT"] = "en_US.utf8"
      Kelvin::Locale.fahrenheit?.should eq(true)
    end
  end
end
