*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Clicar Em Continuar Servidor
    Clicar Na Imagem    ${IMAGENS_LOGIN}/continuar-sel-servidor.png

Fazer Login
    [Arguments]    ${usuario}    ${senha}
    Log To Console              ${IMAGENS_LOGIN}
    Aguardar Imagem Aparecer    ${IMAGENS_LOGIN}/campo-usuario.png    30
    Digitar No Campo            ${IMAGENS_LOGIN}/campo-usuario.png    ${usuario}
    Pressionar Tecla            {TAB}
    Digitar No Campo            ${IMAGENS_LOGIN}/campo-senha.png    ${senha}
    Clicar Na Imagem            ${IMAGENS_LOGIN}/botao-entrar.png

Selecionar Turno        
    [Arguments]    ${turno}
    [Documentation]    Seleciona o turno do usuário (0 - Turno Geral, 1 - Turno Específico)
    IF    '${turno}' == '0'
        Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/botao-selecionar.png    30
        Clicar Na Imagem            ${IMAGENS_TURNO}/botao-selecionar.png
        Clicar Na Imagem            ${IMAGENS_TURNO}/ok.png
        Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/botao-ok.png    30
        Clicar Na Imagem            ${IMAGENS_TURNO}/botao-ok.png
    ELSE
        Wait Until Keyword Succeeds   60s    2s    Ativar Janela
        Log To Console                Informando data atual pra verificar se tem turno aberto
        ${data_hoje}=                 Get Current Date    result_format=%d/%m/%Y
        Log To Console                Data atual: ${data_hoje}
        Wait Until Keyword Succeeds   60s    2s    Ativar Janela
        Aguardar Imagem Aparecer      ${IMAGENS_TURNO}/campo-data-turno.png    30
        Digitar No Campo              ${IMAGENS_TURNO}/campo-data-turno.png    ${data_hoje}
        Pressionar Tecla              {TAB}
        Pressionar Tecla              {ENTER}
        ${nao_existe_turno}=          Run Keyword And Return Status    Aguardar Imagem Aparecer      ${IMAGENS_TURNO}/msg-turno-inexistente.png    5
        Log To Console                Resultado da variável: ${nao_existe_turno}
        IF    ${nao_existe_turno}
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/botao-ok-turno-inexistente.png    30
            Clicar Na Imagem            ${IMAGENS_TURNO}/botao-ok-turno-inexistente.png
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/botao-novo-turno.png    30
            Clicar Na Imagem            ${IMAGENS_TURNO}/botao-novo-turno.png
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/botao-abrir-turno.png    30
            Clicar Na Imagem            ${IMAGENS_TURNO}/botao-abrir-turno.png
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/msg-abertura-turno.png    30
            Clicar Na Imagem            ${IMAGENS_TURNO}/botao-sim.png
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/msg-encerrantes.png    30
            Clicar na Imagem            ${IMAGENS_TURNO}/botao-sim.png
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/msg-diferenca-data.png    30
            Clicar na Imagem            ${IMAGENS_TURNO}/botao-sim.png
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/msg-operando-turno.png    30
            Clicar Na Imagem            ${IMAGENS_TURNO}/botao-ok-pontilhado.png
        ELSE
            Aguardar Imagem Aparecer    ${IMAGENS_TURNO}/msg-operando-turno.png    30
            Clicar Na Imagem            ${IMAGENS_TURNO}/botao-ok-pontilhado.png
        END
    END

Efetuar Login Completo
    [Documentation]    Fluxo completo: login + selecionar turno (sistema deve estar aberto)
    [Arguments]    ${usuario}    ${senha}
    Aguardar Janela Ativa
    Clicar Em Continuar Servidor
    Fazer Login    ${usuario}    ${senha}
    Selecionar Turno    1