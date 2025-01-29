*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser    # No final, fecha o navegador

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Chrome    # opções de navegador como explore, edge

*** Test Cases ***
# Frases --> Keywords
Selecionar Sauce Labs Backpack
    Dado que acesso o site SauceDemo
    Quando preencho o campo usuario    standard_user
    E preencho o campo senha    secret_sauce
    E clico no botao Login
    Entao sou direcionado para pagina de produtos
    Quando clico no produto    Sauce Labs Backpack    $29.99
    Entao sou direcionado para pagina do produto
    Quando clico em adicionar no carrinho
    Entao visualizo o numero de itens no carrinho    1
    Quando clico no icone do carrinho
    Entao sou direcionado para a pagina do carrinho
    Quando clico no menu burguer
    E clico em Logout
    Então sou direcionado para pagina de login

Selecionar Sauce Labs Backpack Login com enter
    Dado que acesso o site SauceDemo
    Quando preencho o campo usuario    standard_user
    E preencho o campo senha    laranja
    E pressiono a tecla Enter

*** Keywords ***
Dado que acesso o site SauceDemo
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    5000ms    # unidade 5000ms / pagina de transição wait
Quando preencho o campo usuario
    [Arguments]    ${username}
    Input Text     css=[data-test="username"]    ${username}  

 E preencho o campo senha
     [Arguments]    ${password}
     Input Password    css=[data-test="password"]    ${password}

 E clico no botao Login
    Click Button    css=[data-test="login-button"]

E pressiono a tecla Enter
    Press Key    css=[data-test="password"]    ENTER

Entao sou direcionado para pagina de produtos
    #Wait Until Element Is Visible    css=[data-test="title"] 
    #Element Text Should Be    css=[data-test="title"]    Products
    # substitui as duas linha de código, e pode identificar um elemento na tela
    Wait Until Element Contains    css=[data-test="title"]    Products    5000ms

 Quando clico no produto
     [Arguments]    ${product_name}    ${product_price}
     Set Test Variable    ${test_product_name}    ${product_name}
     Set Test Variable    ${test_product_price}    ${product_price}
     Click Element    css=img[alt="${test_product_name}"]            

Entao sou direcionado para pagina do produto
    Wait Until Element Is Visible    name=back-to-products
    Element Should Be Visible        name=back-to-products    Back to products
    Element Should Be Visible        css=div.inventory_details_name.large_size    ${test_product_name}    
    Element Should Be Visible        css=div.inventory_details_price    ${test_product_price}

Quando clico em adicionar no carrinho
    Click Element   css=button.btn.btn_primary.btn_small.btn_inventory

Entao visualizo o numero de itens no carrinho
    [Arguments]    ${cart_itens}
    Set Test Variable    ${test_cart_itens}    ${cart_itens}
    Wait Until Element Is Visible    css=span.shopping_cart_badge
    Element Text Should Be    css=span.shopping_cart_badge    ${test_cart_itens}

Quando clico no icone do carrinho
    Click Link    ${test_cart_itens}

Entao sou direcionado para a pagina do carrinho
    Wait Until Element Contains    css=.title    Your Cart
    Element Text Should Be    css=.inventory_item_name    ${test_product_name}
    Element Text Should Be    css=.inventory_item_price    ${test_product_price}
    Element Text Should Be    css=.cart_quantity    ${test_cart_itens}

 Quando clico no menu burguer
     Click Element    id=react-burger-menu-btn

E clico em Logout
    Click Element    link=Logout

Então sou direcionado para pagina de login
    Wait Until Element Is Visible    css=input.submit-button.btn_action    5000ms







