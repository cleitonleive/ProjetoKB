*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${HOME_URL}  https://www.kabum.com.br
${BROWSER}  Chrome
${LOGIN_PAGE}  ${HOME_URL}/login
${INPUT_USUARIO}  id=inputUsuarioLogin
${INPUT_SENHA}    id=inputSenhaLogin
${BTN_LOGIN}      id=botaoLogin
${Error_message}  class=sc-gKclnd hJDeTo
${Search_bar}     id=input-busca
${Search_button}  xpath=/html/body/div[1]/header/div[1]/div/div[2]/div/form/button
${Category}       https://www.kabum.com.br/celular-smartphone
${Buy_button}     xpath=//*[@id="blocoValores"]/div[2]/button

*** Keywords ***
User is on login page
    Open Browser    ${LOGIN_PAGE}  ${BROWSER}
    Maximize Browser Window

User fills the field E-mail, CPF ou CNPJ with ${TEXTO_USR}
    inpuT Text  ${INPUT_USUARIO}  ${TEXTO_USR}

User fills the Senha field with ${TEXTO_SNH}
    inpuT Text  ${INPUT_SENHA}  ${TEXTO_SNH}    

User clicks "Entrar" button
    Click Button  ${BTN_LOGIN}

System should display the message "Dados inválidos, tente novamente!"
    Wait Until Page Contains  Dados inválidos, tente novamente!
    Sleep  4s
    Close Browser

User is on home page again
    Open Browser    ${HOME_URL}  ${BROWSER}
    Maximize Browser Window

User clicks on search bar
    Click element  ${Search_bar}

User fills the "Pesquisa" field with "Iphone 11"
    inpuT text  ${Search_bar}  Iphone 11
    Sleep  1s

User clicks "Pesquisar" button
    Click button  ${Search_button}

System should display results page with text "Você pesquisou por: Iphone 11"
    Wait Until Page Contains  Você pesquisou por:
    Sleep  4s
    Close Browser

User is on home page
    Open Browser    ${HOME_URL}  ${BROWSER}
    Maximize Browser Window

User clicks on the category "Celular & Smartphone"
    Go to  ${Category}
    Sleep  1s

User clicks on the first "Comprar" button
    Click link  partial link=R$
    Click element  ${Buy_button}

System should display the message "PRODUTO ADICIONADO NO CARRINHO"
    Wait Until Page Contains  PRODUTO ADICIONADO NO CARRINHO
    Sleep  4s
    Close Browser