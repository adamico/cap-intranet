require 'spec_helper'

describe Enquete do
  describe "validations" do
    it_should_behave_like "a model with a titre", "enquete"
  end
  describe ".en_cours" do
    subject {Enquete}
    it "should exist as a class method" do
      subject.should respond_to(:en_cours)
    end
    it "should return alertes en cours" do
      5.times {|i| Factory(:enquete)}
      5.times {|i| Factory(:enquete_terminee)}
      subject.en_cours.all.count.should == 5
    end
  end
end
