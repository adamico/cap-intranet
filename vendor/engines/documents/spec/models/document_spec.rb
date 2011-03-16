require 'spec_helper'

describe Document do
  it_should_behave_like "an asciiable model", Factory.build(:document)
  describe "validations" do
    it_should_behave_like "a model with a titre", "document"
  end
  it "should have a default scope ordering by date field" do
    ordered_documents = [].tap do |documents|
      documents << Factory(:document)
    end
    Document.first.should === ordered_documents.last
  end
  describe ".recent" do
    subject {Document}
    it "should exist as a class method" do
      subject.should respond_to(:recent)
    end
    it "should return recent documents" do
      10.times {|i| Factory(:document, :titre => "alerte#{i}")}
      Document.recent.all.count.should == 5
    end
  end
end
