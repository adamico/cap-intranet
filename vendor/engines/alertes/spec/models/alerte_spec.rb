require 'spec_helper'

describe Alerte do
  describe "validations" do
    it_should_behave_like "a model with a titre", "alerte"
  end

  it_should_behave_like "a categorisable model", Factory.build(:alerte)

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
