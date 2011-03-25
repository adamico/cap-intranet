require 'spec_helper'

describe Colloque do

  def reset_colloque(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @colloque.destroy! if @colloque
    @colloque = Colloque.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_colloque
  end

  context "validations" do
    
    it "rejects empty title" do
      Colloque.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_colloque
      Colloque.new(@valid_attributes).should_not be_valid
    end
    
  end

end