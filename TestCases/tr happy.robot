*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...               In this test case, we are generally testing boutique pages

Library           SeleniumLibrary  run_on_failure=Take screenshot and get current url
Library           String
Library           DateTime
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections

Suite Setup       Open Browser    ${url.trendyol}

Test Setup        User logs in with username  RANDOM AND


Suite Teardown    Dota Teardown  ${SUITE STATUS}  ${SUITE NAME}

Force Tags        happy path

*** Test Cases ***
As a user, I should see all the boutiques page
