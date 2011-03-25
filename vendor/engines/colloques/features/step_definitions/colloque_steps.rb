Given /^I have no colloques$/ do
  Colloque.delete_all
end

Given /^I (only )?have colloques titled "?([^\"]*)"?$/ do |only, titles|
  Colloque.delete_all if only
  titles.split(', ').each do |title|
    Colloque.create(:title => title)
  end
end

Then /^I should have ([0-9]+) colloques?$/ do |count|
  Colloque.count.should == count.to_i
end
