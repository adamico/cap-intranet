require 'spec_helper'

describe Enquete do
  it_should_behave_like "an asciiable model", Factory.build(:enquete)
  it_should_behave_like "a categorisable model", Factory.build(:enquete)
  describe "validations" do
    it_should_behave_like "a model with a titre", "enquete"
  end
  it "should have a default scope ordering by publication field" do
    ordered_enquetes = [].tap do |enquetes|
      enquetes << Factory(:enquete)
    end
    Enquete.first.should === ordered_enquetes.last
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
