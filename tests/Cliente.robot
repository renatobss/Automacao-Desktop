*** Settings ***
Documentation    Testes de cadastro de cliente no sistema XPert
Resource         ../resources/pages/LoginPage.resource
Resource         ../resources/pages/ClientePage.resource
Resource         ../resources/keywords/Screenshot.resource
Suite Setup      Abrir Sistema E Login
Suite Teardown   Fechar Sistema
Test Teardown    Run Keyword If Test Failed    Capturar Evidencia

*** Test Cases ***
Cadastrar Novo Cliente com Sucesso
    [Documentation]    Testes de cadastro de cliente no sistema XPert
    [Tags]    cliente    cadastro    smoke
    Abrir Gerenciamento de Entidades
    Abrir Cadastro de Cliente
    Preencher Dados do Cliente    16655455006    Cliente Teste    
    Salvar Cliente
    Fechar Gerenciamento de Entidades

Deletar Cadastro De Cliente
    [Tags]    cliente    deletar
    Abrir Gerenciamento de Entidades
    Pesquisar Cliente    Cliente Teste
    Deletar Cliente
    Limpar Campo de Pesquisa
    Fechar Gerenciamento de Entidades