shared_examples_for "an asciiable model" do |instance|
  subject {instance}
  it {should respond_to(:asciiable?)}

  describe "#ascii_titre" do
    it "should return titre without utf chars" do
      subject.send(:ascii_titre).should == subject.titre.to_ascii
    end
  end
  describe "#ascii_contenu" do
    context "when contenu is not blank" do
      it "should return contenu without utf chars" do
        subject.contenu = "sample contenu"
        subject.send(:ascii_contenu).should == subject.contenu.to_ascii
      end
    end
  end
end
