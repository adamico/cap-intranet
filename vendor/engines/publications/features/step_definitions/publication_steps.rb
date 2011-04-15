Given /^I have no publications$/ do
  Publication.delete_all
end

Given /^I (only )?have publications titled "?([^\"]*)"?$/ do |only, titles|
  Publication.delete_all if only
  titles.split(', ').each do |title|
    Publication.create(:title => title)
  end
end

Then /^I should have ([0-9]+) publications?$/ do |count|
  Publication.count.should == count.to_i
end
