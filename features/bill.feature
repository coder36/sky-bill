Feature: View my Sky Bill
  In order to manage my sky products
  As a sky customer
  I want to be able to view my sky bill

Scenario: View bill
  Given My data is available in a json format at http://safe-plains-5453.herokuapp.com/bill.json
  When I navigate to the bill page
  Then I can see a breakdown of my bill
  And the Subscriptions section should have a total of £71.40
  And the Sky Store section should have a total of £24.97
  And the Call Charges section should have a total of £59.64
  And the Total section should have a total of £136.03
