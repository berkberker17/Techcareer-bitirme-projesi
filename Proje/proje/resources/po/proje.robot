*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    DebugLibrary


*** Variables ***
${HOMEPAGE}    https://www.kariyer.net/
${BROWSER}    chrome


*** Keywords ***
create session
    open browser    ${HOMEPAGE}   ${BROWSER}
    maximize browser window
    wait until element is visible    xpath=//*[@id="Header"]/div[2]/div[1]/a/img
#click cerez button
    #click element    xpath=//*[@id="index-page"]/body/div[6]/div[1]/button
click find job button
    click element    id=btnFindWork
    wait until element is visible    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[1]/div/div/div/h1
    sleep    3s
click the city button
    click element    css=.cursor-pointer.text-secondary
    click element    css=.modal-blue-border .checkbox-field div:nth-of-type(3)
    click element    css=.modal-blue-border .checkbox-field div:nth-of-type(4)
    click element    css=.modal-blue-border .checkbox-field div:nth-of-type(5)
    click element    css=.modal-blue-border.k-shadow .checkbox-field div:nth-of-type(6)
    click element    css=.modal-blue-border.k-shadow [class='material-icons p-1']
click the tarih button
    wait until page contains    Tarih
    click element    css=[collapseid] [role] [class='w-100 pb-1 custom-control custom-control-inline custom-radio']:nth-of-type(5)
click the uygula button
    click element    xpath=//*[@id="submitButtonContainer"]/button
check the filter is ilanlar page
    wait until page contains element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/div/div
    wait until page contains    Seçili Filtreler (5)
    ${ILAN}=    get text    css=[class='t-6 text-secondary mb-3 search-result-section']
    sleep    3s
    click element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/div/div/div[4]/i
    sleep    2s
    click element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/div/div/div[3]/i
    wait until page contains element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/div/div/div[1]
    wait until page contains element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/div/div/div[2]
    wait until page contains element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/div/div/div[3]
    wait until page contains    Seçili Filtreler (3)
    ${ILAN1}=    get text    css=[class='t-6 text-secondary mb-3 search-result-section']
    should not be equal    ${ILAN1}    ${ILAN}    ilan sayısı azaldı.
    sleep    3s
    click element    xpath=//*[@id="__layout"]/div/div[2]/div/div[1]/div[2]/div[2]/div[2]/div[2]/h3/a
    wait until location contains    https://www.kariyer.net/is-ilanlari
    sleep    4s
    ${ILAN2}=    get text    css=[class='t-6 text-secondary mb-3 search-result-section']
    should not be equal    ${ILAN2}    ${ILAN1}    ilan sayısı arttı.
close session
    close browser
