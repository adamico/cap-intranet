require 'spec_helper'

describe Alerte do
  it_should_behave_like "an asciiable model", Factory.build(:event)
  it_should_behave_like "a categorisable model", Factory.build(:event)
  describe "validations" do
    it_should_behave_like "a model with a titre", "alerte"
  end
  it "should have a default scope ordering by date field" do
    ordered_alertes = [].tap do |alertes|
      alertes << Factory(:alerte)
    end
    Alerte.first.should === ordered_alertes.last
  end
  describe ".recent" do
    subject {Alerte}
    it "should exist as a class method" do
      subject.should respond_to(:recent)
    end
    it "should return recent alertes" do
      10.times {|i| Factory(:alerte, :titre => "alerte#{i}")}
      Alerte.recent.all.count.should == 5
    end
  end
end
