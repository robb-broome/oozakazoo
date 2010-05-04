require 'spec_helper'

describe BaseEntity do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Entity.create!(@valid_attributes)
  end

  it "should cease to exist if deleted" do
  end

  it "can have one or many owners" do
  end

  it "can have a sibling" do
  end

  it "can be changed only by an editor" do
  end

  it "can be viewed by anyone with view access" do
  end

  it "can be linked to another entity by an edge" do
  end

  
end
