@search_tests
Feature: Test for search shoes on EBay

  @test
  Scenario: User able to search PUMA shoes and perform custom actions
    Given I land on the home screen
    When I press on search bar
    Then I type "NIKE" in search field
    And I select the filter option
    And I select the Brand option
    And I select PUMA brand
    Then I select the size 10
    And I print the number of results
    Then I order by price ascendant
    And I take the first 5 products with their prices and print them in console
    And I order and print the products by price in descendant mode






