When("I click on {string} button") do |buttonText|
  click_button buttonText
end

When("I fill an article title with {string}") do |title|
  find(:xpath, "//input[@name='article[title]']").set title
end

When("I fill an article text with {string}") do |text|
  find(:xpath, "//textarea[@name='article[text]']").set text
end

When("I click on Show button for my article title:{string}, text:{string}") do |title, text|
  showButton = find(:xpath, getXpathForShowButton(title, text))
  showButton.click
end

When("I click on Edit button for my article title:{string}, text:{string}") do |title, text|
  editButton = find(:xpath, getXpathForEditButton(title, text))
  editButton.click
end

When("I click on Destroy button for my article title:{string}, text:{string}") do |title, text|
  destroyButton = find(:xpath, getXpathForDestroyButton(title, text))
  destroyButton.click
end

When("I want to find article to delete") do
  title = "New Usual Article Title"
  text = "New Usual Article Text"
  destroyButton = find(:xpath, getXpathForDestroyButton(title, text))
end

Then("I see my article title:{string}") do |title|
  numberOfTitleTag = "1"
  titleText = find(:xpath, getXpathForArticleDetails(numberOfTitleTag)).text
  expect("Title: " + title).to eq(titleText)
end

Then("I see my article text:{string}") do |text|
  numberOfTextTag = "2"
  contentText = find(:xpath, getXpathForArticleDetails(numberOfTextTag)).text
  expect("Text: " + text).to eq(contentText)
end

Then("There are no error messages") do
  checkBlankError(false)
  checkTooShortError(false)
  checkTwoErrorsDisplayed(false)
  checkOneErrorDisplayed(false)  
end

Then("There is too short title error message") do
  checkTooShortError(true)
end

Then("There is blank title error message") do
  checkBlankError(true)
end

Then("There is one mistake error message") do
  checkOneErrorDisplayed(true)  
end

Then("There is two mistakes error message") do
  checkTwoErrorsDisplayed(true)  
end

private def checkTwoErrorsDisplayed(isError)
  if isError
    expect(page).to have_content("2 errors prohibited this article from being saved:")
  else
    expect(page).not_to have_content("2 errors prohibited this article from being saved:")
  end
end

private def checkOneErrorDisplayed(isError)
  if isError
    expect(page).to have_content("1 error prohibited this article from being saved:")
  else
    expect(page).not_to have_content("1 error prohibited this article from being saved:")
  end
end

private def checkBlankError(isError)
  if isError
    expect(page).to have_content("Title can't be blank")
  else
    expect(page).not_to have_content("Title can't be blank")
  end
end

private def checkTooShortError(isError)
  if isError
    expect(page).to have_content("Title is too short (minimum is 5 characters)")
  else
    expect(page).not_to have_content("Title is too short (minimum is 5 characters)")
  end
end

private def getXpathForShowButton(title, text)
  getXpathForArticleRow(title, text) + "/td[3]/a"
end

private def getXpathForEditButton(title, text)
  getXpathForArticleRow(title, text) + "/td[4]/a"
end

private def getXpathForDestroyButton(title, text)
  getXpathForArticleRow(title, text) + "/td[5]/a"
end

private def getXpathForArticleRow(title, text)
  "(.//td[text()='" + title + "']/following-sibling::td[text()='" + text + "']/parent::*)[1]"
end

private def getXpathForArticleDetails(numberOfDetails)
  "(.//p)[" + numberOfDetails + "]"
end
