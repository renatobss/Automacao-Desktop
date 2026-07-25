*** Settings ***
Library    SikuliLibrary
Library    RPA.Windows
Library    Process
Resource   Variables.resource
Resource   pages/LoginPage.resource
Resource   keywords/Controle.resource
Resource   keywords/Mouse.resource
Resource   keywords/Keyboard.resource
Resource   keywords/Wait.resource
Resource   keywords/Validation.resource
Resource   keywords/Menu.resource
Resource   keywords/Generica.resource

*** Keywords ***
Abrir Sistema
    Start Process    ${APP}

Abrir Sistema E Login
    [Documentation]    Abre o sistema e realiza login completo
    Abrir Sistema
    Efetuar Login Completo    ${USUARIO}    ${SENHA}

Fechar Sistema
    [Documentation]    Fecha o sistema XPert
    Terminate All Processes