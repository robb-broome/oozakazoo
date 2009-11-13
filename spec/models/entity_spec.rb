require 'spec_helper'

describe Entity do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Entity.create!(@valid_attributes)
  end
end
