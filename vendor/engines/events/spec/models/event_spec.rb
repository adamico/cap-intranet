require 'spec_helper'

describe Event do
  it_should_behave_like "a categorisable model", Factory.build(:event)
  context "validations" do
    it_should_behave_like "a model with a titre", "event"
    subject {Factory.build(:event)}
    it "rejects nil start_at" do
      subject.start_at = nil
      subject.should_not be_valid
    end
    it "rejects nil end_at" do
      subject.end_at = nil
      subject.should_not be_valid
    end
  end
  describe ".next" do
    subject {Event}
    it "should exist as a class method" do
      subject.should respond_to(:next)
    end
    it "should return next events" do
      5.times {Factory(:event)}
      (1..5).each {|n| Factory(:event, 
                               :start_at => Time.now - n.days
                               )}
      Event.next.all.count.should == 5
    end
  end
end
