Given /^I have no enquetes$/ do
  Enquete.delete_all
end

Given /^I (only )?have enquetes titled "?([^\"]*)"?$/ do |only, titles|
  Enquete.delete_all if only
  titles.split(', ').each do |title|
    Enquete.create(:titre => title)
  end
end

Then /^I should have ([0-9]+) enquetes?$/ do |count|
  Enquete.count.should == count.to_i
end
