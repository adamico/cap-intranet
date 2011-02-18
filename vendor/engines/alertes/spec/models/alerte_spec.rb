require 'spec_helper'

describe Alerte do
  context "validations" do
    subject {Factory.build(:alerte)}
    it "rejects empty titre" do
      subject.titre = ""
      subject.should_not be_valid
    end
    it "rejects non unique titre" do
      subject.save!
      Alerte.new(:titre => subject.titre).should_not be_valid
    end
  end

  it_should_behave_like "a categorisable model", Factory.build(:alerte, :titre => "valid titre")

  describe ".recent" do
    subject {Alerte}
    it "should exist as a method" do
      subject.should respond_to(:recent)
    end
    it "should return recent alertes" do
      10.times {|i| Factory(:alerte, :titre => "alerte#{i}")}
      Alerte.recent.all.count.should == 5
    end
  end
end
