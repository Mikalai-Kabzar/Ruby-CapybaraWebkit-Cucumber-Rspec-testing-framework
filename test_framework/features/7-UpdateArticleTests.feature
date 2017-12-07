Feature: Update of test articles
As an authorized user
In order of using blog
I want to update articles.

    Background: Login, go to articles page and click 'New article'
        Given I login to blog
        And I am on a blog article page

    Scenario Outline: Update article positive tests
        When I click on Edit button for my article title:"<title>", text:"<text>"
        And I fill an article title with "<new title>"
        And I fill an article text with "<new text>"
        And I click on 'Update Article' button    
        Then I see my article title:"<new title>"
        And I see my article text:"<new text>"

        Examples:
            | title             | text             | new title     | new text     |
            | New Article Title | New Article Text | Updated title | Updated text |

    Scenario Outline: Update article with too short titles negative tests
        When I click on Edit button for my article title:"<title>", text:"<text>"
        And I fill an article title with "<new title>"
        And I fill an article text with "<new text>"
        And I click on 'Update Article' button 
        Then There is too short title error message
        And There is one mistake error message

        Examples:
            | title         | text         | new title | new text         |
            | Updated title | Updated text | 4sym      | New Article Text |
            | Updated title | Updated text | 1         |                  |

    Scenario Outline: Update article with empty title negative test
        When I click on Edit button for my article title:"<title>", text:"<text>"
        And I fill an article title with "<new title>"
        And I fill an article text with "<new text>"
        And I click on 'Update Article' button 
        Then There is blank title error message
        And There is two mistakes error message

        Examples:
            | title         | text         | new title | new text    |
            | Updated title | Updated text |           | Empty title |



