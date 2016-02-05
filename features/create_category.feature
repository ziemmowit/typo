Feature: Create Categories
  As a blog administrator
  In order to systematize my blog posts
  I want to be able to add post categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
    Scenario: Successfully create categories
    Given I am on the new category page
    When I fill in "category_name" with "Foobar"
    And I fill in "category_keywords" with "Foo, Bar"
    And I fill in "category_permalink" with "foobar"
    And I fill in "category_description" with "Lorem ipsum dolor sit amet"
    And I press "Save"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    Then I should see "foobar"
    Then I should see "Lorem ipsum dolor sit amet"
