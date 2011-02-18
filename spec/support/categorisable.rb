shared_examples_for "a categorisable model" do |instance|
  subject {instance}
  it "should respond_to #with_categorie" do
    subject.class.should respond_to(:with_categorie)
  end

  it {should respond_to(:categorisable?)}
  it {should respond_to(:categories_names)}

  describe "when saved" do
    before do
      (1..3).each do |i|
        Categorie.find_or_create_by_name("cat#{i}")
      end
    end

    subject {instance}
    it "should assign categories" do
      categories = Categorie.all
      subject.categories_names = categories.map(&:name)
      subject.save!
      subject.categories.should == categories
    end
  end
end
