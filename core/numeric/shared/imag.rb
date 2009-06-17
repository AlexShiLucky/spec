require File.dirname(__FILE__) + '/../../../spec_helper'

describe :numeric_imag, :shared => true do
  before(:each) do
    @numbers = [
      20,             # Integer
      398.72,         # Float
      Rational(3, 4), # Rational
      99999999**99, # Bignum
      Float::MAX * 2, # Infinity
      0/0.0           # NaN
    ] 
  end

  it "returns 0" do
    @numbers.each do |number| 
      number.send(@method).should == 0
    end
  end  

  it "raises an ArgumentError if given any arguments" do
   @numbers.each do |number| 
     lambda { number.send(@method, number) }.should raise_error(ArgumentError)
   end
  end
end  
