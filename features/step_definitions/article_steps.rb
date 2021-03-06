Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Article.create article
  end
end

Given /^the following comments exist:$/ do |table|
  table.hashes.each do |comment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Comment.create comment
  end
end

Then /^I should see merge_with$/ do
  if page.respond_to? :should
    page.should have_xpath('//input[@id="merge_with"]')
  else
    assert page.has_xpath?('//input[@id="merge_with"]')
  end
end

Then /^the article "(.*?)" should have body "(.*?)"$/ do |arg1, arg2|
  Article.find_by_title(arg1).body.should eq arg2
end

Then /^the comment "(.*?)" should belong to "(.*?)"$/ do |arg1, arg2|
  article = Article.find_by_title(arg2)
  Comment.find_by_body(arg1).article.id.should eq article.id
end
