Feature: Check. All web element exists on a blog's web pages.
As a user
In order of using blog
I want to see all web elements on a page

    Scenario: Looking for all blog 'Main' page's web elements 
        Given I am on a blog main page
        Then I see a webelement with "Hello, Rails!" text

    Scenario Outline: Looking for all blog 'Article' page's web elements 
        Given I am on a blog article page
        Then I see a webelement with "<ExampleText>" text

        Examples: text of webelement
            | ExampleText      |
            | Listing Articles |
            | New article      |
            | Title            |
            | Text             |
            
