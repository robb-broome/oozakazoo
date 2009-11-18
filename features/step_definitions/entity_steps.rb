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
  Entity.create!(:title => name, :type =>  entity_types[:user] )
end

Given /^the catalog is set up$/ do
  pending
end

Then /^"([^\"]*)" should be linked to ([^\"]*) entity "([^\"]*)"$/ do |entity1, entity_type, entity_2|
  pending
end

Then /^I should see the catalog listed plus ([0-9]+) other entities$/ do |num_entities|
  catalog_entities = Entity.count(:entity_type_uuid = entity_types[:catalog])
  all_entities = Entity.count 
  non_cat_entities = all_entities - catalog_entities 
  non_cat_entities.should == num_entities
end
