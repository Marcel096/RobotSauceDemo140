*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Variáveis em Page Object são os seletores dos elementos da página
${txt_usuario}    css=[data-test="username"]
${txt_senha}      css=[data-test="password"]
${btn_login}      id=login-button


*** Keywords ***
# Ações funcionalidade
Preencher Usuario
    [Arguments]    ${usuario}    
    Input Text    ${txt_usuario}    ${usuario}

Preencher Senha
    [Arguments]    ${senha}
    Input Password    ${txt_senha}    ${senha}

Clicar no botao login
    Click Button    ${btn_login}