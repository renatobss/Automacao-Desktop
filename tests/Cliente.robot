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
    [Documentation]    Teste de inserção do cadastro de cliente
    [Tags]    cliente    cadastrar
    Abrir Gerenciamento de Entidades
    Abrir Cadastro de Cliente
    Preencher Dados do Cliente - Aba Principal    16655455006    Cliente Teste    85515000    Rua das Flores    123    Bairro das Flores
    Preencher Dados do Cliente - Aba Financeiro
    Salvar Cliente
    Fechar Gerenciamento de Entidades

Alterar Dados do Cliente
    [Documentation]    Teste de edição do cadastro de cliente
    [Tags]    cliente    editar
    Abrir Gerenciamento de Entidades
    Pesquisar Cliente    Cliente Teste
    Editar Cadastro do Cliente
    Log To Console    Estou aqui
    Alterar Cadastro do Cliente - Aba Principal    82422490085    Cliente Editado
    Log To Console    Estou aqui depois da edição
    Salvar Cliente
    Fechar Gerenciamento de Entidades

Deletar Cadastro Do Cliente
    [Documentation]    Teste de deleção do cadastro de cliente
    [Tags]    cliente    deletar
    Abrir Gerenciamento de Entidades
    Pesquisar Cliente    Cliente Editado
    Deletar Cliente
    Fechar Gerenciamento de Entidades