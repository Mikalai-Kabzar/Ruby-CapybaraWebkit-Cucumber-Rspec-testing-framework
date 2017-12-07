Feature: Check. Negative log in tests
As a user
In order of using blog
I want to have no access with wrong credentials.

    Scenario Outline: Login with wrong credentials       
        Given I login with credentials login:"<username>", password:"<pwd>"
        And I am on a blog article page
        When I click on "New article" link
        Then I don't see a button with "Create Article" text

        Examples:
            | username  | pwd          |
            |           |              |
            |           | password     |
            | login     |              |
            | dhh       | secret_wrong |
            | dhh_wrong | secret       |
