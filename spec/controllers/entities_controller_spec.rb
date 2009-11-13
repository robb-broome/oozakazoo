require 'spec_helper'

describe EntitiesController do

  #Delete these examples and add some real ones
  it "should use EntitiesController" do
    controller.should be_an_instance_of(EntitiesController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
