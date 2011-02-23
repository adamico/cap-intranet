shared_examples_for "a model with a titre" do |instance|
  subject {Factory.build(instance)}
  it "rejects empty titre" do
    subject.titre = ""
    subject.should_not be_valid
  end
  it "rejects non unique titre" do
    subject.save!
    Factory.build(instance, :titre => subject.titre).should_not be_valid
  end
end
