Feature: Creation of a new article tests
As an authorized user
In order of using blog
I want to create a new article with all rules.

    Scenario Outline: Create article tests
        Given I login to blog
        And I am on a blog article page
        When I click on "New article" link
        And I fill an article title with "<title>"
        And I fill an article text with "<text>"
        Then I click on 'Create Article' button
        And There are no error messages 

        Examples:
            | title                         | text                         |
            | New Article Title             | New Article Text             |
            | 5Symb                         | 5Symb                        |
            | Russin text Разработчик title | Russin text Разработчик text |
