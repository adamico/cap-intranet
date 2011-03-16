require 'spec_helper'

describe Event do
  it_should_behave_like "a categorisable model", Factory.build(:event)
  it_should_behave_like "an asciiable model", Factory.build(:event)
  context "validations" do
    subject {Factory.build(:event)}
    it "rejects empty titre" do
      subject.titre = ""
      subject.should_not be_valid
    end
    it "rejects nil start_at" do
      subject.start_at = nil
      subject.should_not be_valid
    end
    it "rejects nil end_at" do
      subject.end_at = nil
      subject.should_not be_valid
    end
  end
  it "should have a default scope ordering by start_at field" do
    ordered_events = [].tap do |events|
      events << Factory(:event)
    end
    Event.first.should === ordered_events.last
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
