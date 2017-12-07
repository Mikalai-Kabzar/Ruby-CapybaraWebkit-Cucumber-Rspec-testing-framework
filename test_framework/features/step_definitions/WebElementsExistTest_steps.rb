Given ('I am on a blog main page') do
  visit '/'
end

Given ('I am on a blog article page') do
  visit '/articles'
end

When("I click on {string} link") do |text|
  click_link text
end

Then("I see a webelement with {string} text") do |text|
  expect(page).to have_content(text)
end

Then("I see a button with {string} text") do |text|
  expect(page).to have_button(text)
end

Then("I don't see a button with {string} text") do |text|
  expect(page).not_to have_button(text)
end