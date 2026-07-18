*** Settings ***
Documentation    Testes de acesso ao sistema
Resource         ../resources/pages/LoginPage.resource
Resource         ../resources/keywords/Screenshot.resource
Suite Setup      Abrir Sistema
Suite Teardown   Fechar Sistema
Test Teardown    Run Keyword If Test Failed    Capturar Evidencia

*** Test Cases ***
Realizar Login Com Sucesso
    [Documentation]    Garante que o login e a seleção de turno funcionam
    Efetuar Login Completo    ${USUARIO}    ${SENHA}