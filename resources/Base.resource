*** Settings ***
Library    SikuliLibrary
Library    RPA.Windows
Library    Process
Resource   Variables.resource
Resource   keywords/Controle.resource
Resource   keywords/Mouse.resource
Resource   keywords/Keyboard.resource
Resource   keywords/Wait.resource
Resource   keywords/Validation.resource
Resource   keywords/Menu.resource

*** Keywords ***
Abrir Sistema
    Start Process    ${APP}