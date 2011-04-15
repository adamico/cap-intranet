require 'spec_helper'

describe Publication do

  def reset_publication(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @publication.destroy! if @publication
    @publication = Publication.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_publication
  end

  context "validations" do
    
    it "rejects empty title" do
      Publication.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_publication
      Publication.new(@valid_attributes).should_not be_valid
    end
    
  end

end