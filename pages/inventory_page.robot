*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# uso para mapear mas não fazemos assert na  page, só no test
${titulo_secao}    css=[data-test="title"]

*** Keywords ***
Clicar no Produto
    [Arguments]    ${product_name}
    Click Element    css=img[alt="${product_name}"]