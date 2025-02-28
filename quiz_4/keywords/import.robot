*** Settings ***
Library     AppiumLibrary
Library     String
Library     DateTime

Variables    ${CURDIR}/../resources/testdata/testdata.yaml
Variables    ${CURDIR}/../resources/settings/${env}/${platform}.yaml

Resource    common.robot

Resource   ${CURDIR}/./pages/todo_list_page.robot
Resource   ${CURDIR}/./pages/todo_form_page.robot


Resource    ${CURDIR}/./locator/${platform}/todo_list_locator.robot
Resource    ${CURDIR}/./locator/${platform}/todo_form_locator.robot

Resource    ${CURDIR}/./features/todo_list_feature.robot
Resource    ${CURDIR}/./features/todo_form_feature.robot