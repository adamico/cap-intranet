Given /^I have no documents$/ do
  Document.delete_all
end

Given /^I (only )?have documents titled "?([^\"]*)"?$/ do |only, titles|
  Document.delete_all if only
  titles.split(', ').each do |title|
    Document.create(:titre => title)
  end
end

Then /^I should have ([0-9]+) documents?$/ do |count|
  Document.count.should == count.to_i
end
