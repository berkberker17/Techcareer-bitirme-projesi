*** Settings ***
Documentation    Suite description
Resource    ../Resources/po/proje.robot
*** Keywords ***
check the result
    proje.create session
    #proje.click cerez button
    proje.click find job button
    proje.click the city button
    proje.click the tarih button
    proje.click the uygula button
    proje.check the filter is ilanlar page
    proje.close session
