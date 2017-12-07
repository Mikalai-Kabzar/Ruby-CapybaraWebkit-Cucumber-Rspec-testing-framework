Feature: Check. Positive log in test
As a user
In order of using blog
I want to have granted access with correct credentials.

    Scenario: Login with correct credentials
        Given I login with credentials login:"dhh", password:"secret"
        And I am on a blog article page
        When I click on "New article" link
        Then I see a button with "Create Article" text
   
