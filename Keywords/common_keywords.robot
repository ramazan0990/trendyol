*** Settings ***
Library           SeleniumLibrary
Library           String
Library           DateTime
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections

Variables         ../Resources/tr.yaml


*** Variables ***
${browser_name}



*** Keywords ***
user clicks the login button
    Click Element    ${Homepage.login_button}

Input Username
    [Arguments]    ${username}

    wait until page contains    E-posta Adresi
    Input Text    ${Login.username_input}    ${username}

Input Password
    [Arguments]    ${password}
    wait until page contains    Şifre
    Input Text    ${Login.password_input}    ${password}

user logs in
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains    E-posta Adresi
    Input Text    ${Login.username_input}    ${username}
    Input Text    ${Login.password_input}    ${password}
    Click Element    css=#loginSubmit

user should see the images uploaded on each tab
    : FOR    ${INDEX}    IN RANGE    1    2
    \    ${all_boutiques}   get webelements  css=.bigBoutiqueImage.lazy-load-trigger.loaded
    \    ${temp}  get length  ${all_boutiques}
    \    Log To Console    ${temp}
    \    Scroll to element  ${other.boutique_image3}
    \    Scroll to element  ${other.boutique_image6}
    \    Scroll to element  ${other.boutique_image9}
    \    Scroll to element  ${other.boutique_image12}
    \    Scroll to element  ${other.boutique_image15}
    \    Scroll to element  ${other.boutique_image18}
    \    Scroll to element  ${other.boutique_image20}
    ${all_boutiques}   get webelements  css=.bigBoutiqueImage.lazy-load-trigger.loaded
    ${temp}  get length  ${all_boutiques}
    should be equal as integers  ${temp}  20

Scroll to element
    [Arguments]  ${other.boutique}
    ${window_size}  Get Window Size
    ${scroll_size}    evaluate    ${window_size[0]}/1
    Execute Javascript  window.scrollTo(0, 0)
    ${Height}    Get Vertical Position    ${other.boutique}
    ${Height}    convert to integer    ${Height}
    ${Height}    evaluate    ${Height}-${scroll_size}
    Execute Javascript  window.scrollTo(0, ${Height})
    sleep    5
    wait until element is visible  ${other.boutique}

User goes to url
    [Documentation]   This keyword will be used for changing current url.
    ...               It can be used with or without logged in.
    ...               Example usage:
    ...               | User goes to url |  ${url.trendyol}  |
    [Arguments]  ${url}
    ${start} =  Get Current Date
    #run keyword and ignore error  load page with timeout  ${url}
    #Wait until page load
    ${stop} =   Get Current Date
    ${diff} =   Subtract Date From Date     ${stop}     ${start}
    Log    Page Load Time: ${diff} seconds - Url: ${url}   level=INFO    console=no

user clicks on female category
    Click Element    ${category.women_category}

user clicks on male category
    Click Element    ${category.male_category}

user clicks on child category
    Click Element    ${category.child_category}

user clicks on sportswear category
    Click Element    ${category.sportswear}

user clicks on shoe and bag category
    Click Element    ${category.shoe_bag}

user clicks on hour and accessory category
    Click Element    ${category.hour_accessory}

user clicks on the first product in the category
    Mouse Over    ${other.catagory_first_product}
    Click Element    ${other.catagory_first_product}

user clicks on any product
    Click Element    ${other.first_product}

user adds the product to the shopping cart
    Click Element    ${other.add_to_basket}
