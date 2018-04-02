*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...               In this test case, we are generally testing boutique pages

Resource          ../Keywords/common_keywords.robot

Suite Setup       Open Browser    ${url.trendyol}  ${browser_name}

Suite Teardown    Close All Browsers

Force Tags        happy path

*** Test Cases ***
As a user, I should see boutique images of all tabs
    Given Reload Page
    And user clicks the login button
    And user logs in  apac.kairos@gmail.com   deneme123
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    And user clicks on female category
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    And user clicks on male category
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    And user clicks on child category
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    And user clicks on sportswear category
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    And user clicks on shoe and bag category
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    And user clicks on hour and accessory category
    And user should see the images uploaded on each tab
    And log to console  "görseller yüklendi"
    When user clicks on the first product in the category
    And user clicks on any product
    Then user adds the product to the shopping cart
