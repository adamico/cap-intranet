Given /^I have no alertes$/ do
  Alerte.delete_all
end

Given /^I (only )?have alertes titled "?([^\"]*)"?$/ do |only, titles|
  Alerte.delete_all if only
  titles.split(', ').each do |title|
    Alerte.create(:titre => title)
  end
end

Then /^I should have ([0-9]+) alertes?$/ do |count|
  Alerte.count.should == count.to_i
end
