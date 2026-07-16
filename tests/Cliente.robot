*** Settings ***
Documentation    Testes de cadastro de cliente no sistema XPert
Resource         ../resources/pages/LoginPage.resource
Resource         ../resources/pages/ClientePage.resource

*** Test Cases ***
Cadastrar Novo Cliente com Sucesso
    [Documentation]    Testes de cadastro de cliente no sistema XPert
    Efetuar Login Completo    ${USUARIO}    ${SENHA}
    Abrir Cadastro de Cliente
    Preencher Dados do Cliente    16655455006    Cliente Teste    
    Salvar Cliente
    Sleep    2s
    Deletar Cliente    Cliente Teste
    Sleep    2s
    Fechar Gerenciamento de Entidades