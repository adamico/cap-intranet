require 'spec_helper'

describe Alerte do

  def reset_alerte(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @alerte.destroy! if @alerte
    @alerte = Alerte.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_alerte
  end

  context "validations" do
    
    it "rejects empty titre" do
      Alerte.new(@valid_attributes.merge(:titre => "")).should_not be_valid
    end

    it "rejects non unique titre" do
      # as one gets created before each spec by reset_alerte
      Alerte.new(@valid_attributes).should_not be_valid
    end
    
  end

end