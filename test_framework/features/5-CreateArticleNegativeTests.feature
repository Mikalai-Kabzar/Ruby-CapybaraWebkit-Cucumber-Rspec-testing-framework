Feature: Creation of a new article negative tests
As an authorized user
In order of using blog
I want to get an error message in case of wrong article creation.

    Background: Login, go to articles page and click 'New article'
        Given I login to blog
        And I am on a blog article page
        And I click on "New article" link

    Scenario Outline: Create article with too short title
        When I fill an article title with "<title>"
        And I fill an article text with "<text>"
        And I click on 'Create Article' button
        Then There is too short title error message
        And There is one mistake error message

        Examples:
            | title | text             |
            | 4sym  | New Article Text |
            | 2s    | N                |
            | 1     |                  |

    Scenario: Create article with empty title
        When I fill an article title with ""
        And I fill an article text with "Yes. There is an empty title"
        And I click on 'Create Article' button
        Then There is blank title error message
        And There is two mistakes error message
        
