require 'spec_helper'

describe Gimp do

  context "if validation is set" do

    it "should be valid with gimp_attribute set" do
      gimp = Gimp.new
      gimp.gimp_attribute = 'foo'
      gimp.valid?.should eq (true)
    end

    it "should be invalid with gimp_attribute not set" do
      gimp = Gimp.new
      gimp.valid?.should eq (false)
    end
  end

  context "if format validation is unset by dont_validate" do

    it "should be valid with gimp_attribute set but with wrong format" do
      Gimp.send(:dont_validate, :gimp_attribute, :format => true)
      gimp = Gimp.new
      gimp.gimp_attribute = '123'
      gimp.valid?.should eq (true)
    end

    it "should be invalid with gimp_attribute not set" do
      Gimp.send(:dont_validate, :gimp_attribute, :format => true)
      gimp = Gimp.new
      gimp.valid?.should eq (false)
    end
  end

  context "when no specific validation type set" do

    it "should remove all validations on attribute" do
      Gimp.send(:dont_validate, :gimp_attribute)
      gimp = Gimp.new
      gimp.valid?.should eq (true)
    end

  end

  context "when no attribute set for dont_validate" do

    it "it should raise an error" do
      lambda {Gimp.send(:dont_validate)}.should raise_error
    end
    
  end
  
end