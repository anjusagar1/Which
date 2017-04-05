Feature: TV Landing page
  As a online customer
  I want to search a product
  and buy the good product available based on reviews


  Scenario: Navigate to Which website
    When I go to Which Television section
    Then Which Television section page should be displayed


  Scenario Outline: As a customer I want to see only specific brand listings when I select specific company from brand listings
    When I select <brand>
    Then <brand> TV listings should be displayed

  Examples:
    | brand     |
    |  Samsung   |


  Scenario: Products within specific price limit
    When I select min and max price
    Then TV listings should be within that price range

   Scenario Outline: As a customer I want to see only specific size televisions available
   When I select <size>
   Then <size> TV listings should be displayed

   Examples:
  | size      |
  |  17-22"   |

   Scenario Outline: As a online customer I want to sort the products
   When I select <order>
   Then TV listings should be displayed in that <order>

   Examples:
     |order|
     |Price (low to high)|


