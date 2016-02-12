Feature: Be able to merge articles
  As a blog administrator
  In order to avoid duplicate ocntent
  I want to be able to marge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
      | id | title        | body                       | author  |
      |  3 | Lorem ipsum  | Lorem Ipsum dolor sit amet | Janusz  |
      |  4 | Pellentesque | Pellentesque non rhoncus   | Cebulak |
    And the following comments exist:
      | id | author       | user_id | body                     | article_id |
      |  1 | cicero       | 1       | Suspendisse id fermentum | 3          |
      |  2 | cezar        | 2       | Maecenas faucibus at     | 4          |
    
  Scenario:
    Given I am on the edit article page for "Lorem ipsum"
    Then I should see "Merge Articles"
    
  Scenario:
    Given I am on the edit article page for "Lorem ipsum"
    Then I should see merge_with
    And I fill in "merge_with" with "4"
    And then I press "Merge"
    Then the article "Lorem ipsum" should have body "Lorem Ipsum dolor sit amet Pellentesque non rhoncus"
    And the comment "Maecenas faucibus at" should belong to "Foobar" 
    And I should be on the articles page for "Lorem ipsum"