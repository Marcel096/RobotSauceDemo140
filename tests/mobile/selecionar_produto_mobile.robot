*** Settings ***
Library           AppiumLibrary

Test Teardown     Close Application

*** Variables ***
${SAUCE_USERNAME}    oauth-marcelo.ds9687-7d8b9
${REMOTE_URL}    https://${SAUCE_USERNAME}:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
*** Test Cases ***
Selecionar Mochila
    Open Application    ${REMOTE_URL}  
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
    # Início dos passos da automação
    ${img_produto} =    Set Variable     xpath=//android.widget.ImageView[@content-desc="Sauce Labs Backpack"]
    Click Element    ${img_produto}
    Swipe    ${520}    ${1890}    ${670}    ${1193}
    ${btn_adicionar_carrinho} =    Set Variable     xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]
    Click Element    ${btn_adicionar_carrinho}
    ${ico_carrinho} =    Set Variable     id=com.saucelabs.mydemoapp.android:id/cartTV
    Click Element    ${ico_carrinho}
    ${lbl_nome_produto} =    Set Variable     xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]
    # usei o click para identificação do elemento mas precisei trocar para verificação Element text should be
    Element Text Should Be    ${lbl_nome_produto}    Sauce Labs Backpack
    ${lbl_preco_produto} =    Set Variable     id=com.saucelabs.mydemoapp.android:id/priceTV
    Element Text Should Be    ${lbl_preco_produto}    $ 29.99