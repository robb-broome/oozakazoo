Given /^I have entities titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Entity.create!(:title => title)
  end 
end

Given /^I have no entities$/ do
  Entity.delete_all
end

Then /^I should have ([0-9]+) entity$/ do |count|
  Entity.count.should == count.to_i
end

Then /^I should see a UUID$/ do
  response.should contain("UUID")
end

Given /^I am an existing user named (.+)$/ do |name|
  Entity.create!(:title => name, :type =>  USER_TYPE )
end
