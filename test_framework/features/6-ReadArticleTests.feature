Feature: Reading of existing articles tests
As a user
In order of using blog
I want to read articles

    Scenario Outline: Read articles
        Given I am on a blog article page
        When I click on Show button for my article title:"<title>", text:"<text>"
        Then I see my article title:"<title>"
        And I see my article text:"<text>"

        Examples:
            | title                         | text                         |
            | New Article Title             | New Article Text             |
            | 5Symb                         | 5Symb                        |
            | Russin text Разработчик title | Russin text Разработчик text |
