*** Settings ***
Library     RequestsLibrary

Variables    ${CURDIR}/../resources/testdata/testdata.yaml

Resource   ${CURDIR}/./pages/get_user_page.robot
