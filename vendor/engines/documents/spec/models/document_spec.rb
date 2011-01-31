require 'spec_helper'

describe Document do

  def reset_document(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @document.destroy! if @document
    @document = Document.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_document
  end

  context "validations" do
    
    it "rejects empty titre" do
      Document.new(@valid_attributes.merge(:titre => "")).should_not be_valid
    end

    it "rejects non unique titre" do
      # as one gets created before each spec by reset_document
      Document.new(@valid_attributes).should_not be_valid
    end
    
  end

end