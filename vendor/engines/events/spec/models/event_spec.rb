require 'spec_helper'

describe Event do

  def reset_event(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @event.destroy! if @event
    @event = Event.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_event
  end

  context "validations" do
    
    it "rejects empty titre" do
      Event.new(@valid_attributes.merge(:titre => "")).should_not be_valid
    end

    it "rejects non unique titre" do
      # as one gets created before each spec by reset_event
      Event.new(@valid_attributes).should_not be_valid
    end
    
  end

end