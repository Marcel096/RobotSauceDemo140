*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    10000ms
${url}        https://www.saucedemo.com
${browser}    Chrome 
${date}

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot   
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms    
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Fechar navegador
    Sleep    5000ms    # pode ser necessário para dar tempo
                      # de realizar a última ação/validação
    # Delete Cookie     
    Close Browser  


Clicar no Carrinho
    Click Element                  css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}

Realizar Logout
    # forma genérica
    Click Element                    id=react-burger-menu-btn
    Click Element                    id=logout_sidebar_link
    Wait Until Element Is Visible    css=.login_logo
    # forma específica
   # Click Button    id=react=burguer-menu-btn
    #Click Link    id=logout_sidebar_link

Obter Data e hora
    # Ler a data e hora do sistema operacional
    ${date} =    Get Current Date
    ${date} =    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    # vai funcionar antes da suite
    ${date}    Set Global Variable    ${date}
    # 
    #${date}    Set Suite Variable    ${date}

Tirar Screenshot   
    [Arguments]    ${screenshot_name}
    # modelar e organizar através do caminho,como add sauce demo
    #Capture Page Screenshot    screenshots/saucedemo/${TEST_NAME}/${date}/${screenshot_name}.png
    Capture Page Screenshot    screenshots/saucedemo/${date}/${TEST_NAME}/${screenshot_name}.png

    