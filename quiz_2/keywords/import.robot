*** Settings ***
Library     SeleniumLibrary
Library     String

Variables    ../resources/testdata/testdata.yaml
Variables    ../resources/translation/en.yaml
Variables    ../resources/setting/env/${env}.yaml

Resource    common.robot

Resource   ./pages/login_page.robot

Resource   ./features/login_feature.robot

Resource   ./locator/login_locator.robot
