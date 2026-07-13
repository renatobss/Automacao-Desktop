*** Settings ***
Documentation    Testes de acesso ao sistema
Resource         ../resources/pages/LoginPage.resource

*** Test Cases ***
Realizar Login Com Sucesso
    [Documentation]    Garante que o login e a seleção de turno funcionam
    Efetuar Login Completo    ${USUARIO}    ${SENHA}