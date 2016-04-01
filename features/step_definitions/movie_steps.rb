
Given(/^the following movies exist:$/) do |table|
  table.hashes.each {|movie| Movie.create!(movie)}
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  page.body.match /.*#{arg1}.*#{arg2}/
end

