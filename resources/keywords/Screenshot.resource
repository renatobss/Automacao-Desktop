*** Settings ***
Library    SikuliLibrary

*** Keywords ***
Capturar Evidencia
    [Documentation]    Tira print da tela atual e salva no log (útil em falhas)
    [Arguments]    ${nome}=evidencia
    Capture Screen