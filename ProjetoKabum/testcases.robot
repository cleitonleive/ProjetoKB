*** Settings ***
Resource        resource.robot
Library         SeleniumLibrary

*** Test Cases ***

Cenário 1: Validar usuario invalido
    Given User is on login page
    When User fills the field E-mail, CPF ou CNPJ with "01100022211"
    And User fills the Senha field with "erewrrew"
    And User clicks "Entrar" button
    Then System should display the message "Dados inválidos, tente novamente!"

Cenário 2: Pesquisa por produto
    Given User is on home page
    When User clicks on search bar
    And User fills the "Pesquisa" field with "Iphone 11"
    And User clicks "Pesquisar" button
    Then System should display results page with text "Você pesquisou por: Iphone 11"


Cenário 3: Selecionar categoria e adicionar produto ao carrinho
    Given User is on home page
    When User clicks on the category "Celular & Smartphone"
    And User clicks on the first "Comprar" button
    Then System should display the message "PRODUTO ADICIONADO NO CARRINHO"
