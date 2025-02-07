*** Settings ***
Library           AppiumLibrary
Library    ../../.venv/Lib/site-packages/robot/libraries/XML.py
# suite setup abrir uma única vez para todos os testes
Suite Setup     Open Application    ${REMOTE_URL}  
    ...    platformName=Android    
    ...    appium:platformVersion=9.0    
    ...    appium:deviceName=Galaxy S9 FHD GoogleAPI Emulator    
    ...    appium:deviceOrientation=portrait    
    ...    appium:app=storage:filename=mda-2.0.1-22.apk    
    ...    appium:appPackage=com.saucelabs.mydemoapp.android   
    ...    appium:appActivity=com.saucelabs.mydemoapp.android.view.activities.SplashActivity    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}   
    #...    sauce:options=[object Object]   
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}
    # FIM DA CONFIGURAÇÃO DO EMULADOR/ APARELHO FÍSICO E DA INICIALIZAÇÃO
# test teardown é para limpa o carrinho para executar o próximo teste
Test Teardown    Limpar Carrinho e Deslogar
Suite Teardown    Close Application

Test Template    Selecionar Mochila

*** Variables ***
${SAUCE_USERNAME}    oauth-marcelo.ds9687-7d8b9
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub


*** Test Cases ***
TC001    Sauce Labs Backpack    $ 29.99    0

TC002    Sauce Labs Bike Light    $ 9.99    0

TC03    Sauce Labs Bolt T-Shirt    $ 15.99    0

TC004    Sauce Labs Fleece Jacket    $ 49.99    0

TC005    Sauce Labs Onesie    $ 7.99    1

TC006    Test.sllTheThings() T-Shirt    $ 15.99    1

*** Keywords ***
Selecionar Mochila

    [Arguments]    ${product_name}    ${product_price}    ${swipe_count}
    # Início dos passos da automação
     ${img_produto} =    Set Variable     xpath=//android.widget.ImageView[@content-desc="${product_name}"]
     FOR    ${counter}    IN RANGE    ${swipe_count}
         Swipe    ${520}    ${1890}    ${670}    ${1193}
     END
    Click Element    ${img_produto}
    Swipe    ${520}    ${1890}    ${670}    ${1193}
    ${btn_adicionar_carrinho} =    Set Variable     xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]
    Click Element    ${btn_adicionar_carrinho}
    ${ico_carrinho} =    Set Variable     id=com.saucelabs.mydemoapp.android:id/cartTV
    Click Element    ${ico_carrinho}
    ${lbl_nome_produto} =    Set Variable     xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]
    # usei o click para identificação do elemento mas precisei trocar para verificação Element text should be
    Element Text Should Be    ${lbl_nome_produto}    ${product_name}
    ${lbl_preco_produto} =    Set Variable     id=com.saucelabs.mydemoapp.android:id/priceTV
    Element Text Should Be    ${lbl_preco_produto}    ${product_price}
Limpar Carrinho e Deslogar
    Click Element    id=com.saucelabs.mydemoapp.android:id/removeBt
    Click Element    id=com.saucelabs.mydemoapp.android:id/menuIV
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[1]/android.widget.TextView[2]