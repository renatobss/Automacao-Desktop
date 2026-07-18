*** Settings ***
Library    RPA.Windows
Library    Process
Library    String
Library    DateTime

*** Variables ***
${APP}    C:\\ATX_122_R01\\AtxExec.exe

*** Keywords ***
Selecionar Cliente
    [Arguments]    ${cliente}

    Wait Until Keyword Succeeds    30s    2s    Ativar Janela
    Enviar Teclas    keys={F2}

    Enviar Teclas    ${cliente}
    Enviar Teclas    {ENTER}

Carregar Combustivel
    [Arguments]    ${linha}

    Wait Until Keyword Succeeds    30s    2s    Ativar Janela
    Enviar Teclas    {HOME}

    FOR    ${i}    IN RANGE    1    ${linha}
        Enviar Teclas    {DOWN}        
    END

    Enviar Teclas    {ENTER}

Acessar Frente de Caixa

    Pegar Turno

    # Acessar Frente de Caixa
    wait Until Keyword Succeeds    30s    2s    Ativar Janela
    Enviar Teclas    keys={F4}
    Enviar Teclas    keys={ENTER}

Pegar Turno

    # Iniciar o aplicativo
    Windows Run    ${APP}

    Control Window    regex:"Configuração de Acesso.*5587"
    Click    name:Continuar

    # Tela de login
    Wait Until Keyword Succeeds    60s    2s    Ativar Janela
    Log To Console    Digitando usuário e senha
    Enviar Teclas    a{TAB}a{ENTER} 
    
    # Aguardar sair do login / abrir tela de turno
    Log To Console    Aguardando pós-login
    Wait Until Keyword Succeeds    60s    2s    Ativar Janela

    # Selecionar o turno do dia (Se existir)
    ${data_hoje}=    Get Current Date    result_format=%d/%m/%Y
    Log To Console    Data de hoje: ${data_hoje}

    Wait Until Keyword Succeeds    60s    2s    Ativar Janela
    Send Keys    keys={TAB}
    Send Keys    keys=${data_hoje}
    Send Keys    keys={TAB}
    Send Keys    keys={ENTER}

    Wait Until Keyword Succeeds    60s    2s    Ativar Janela

    ${status}    ${mensagem}=    Run Keyword And Ignore Error
    ...    Pegar Mensagem
    ...    Sistema operando no turno

    IF    '${status}' == 'PASS'
        Log To Console    Mensagem encontrada: ${mensagem}
        Enviar Teclas    {ENTER}
    ELSE
        Enviar Teclas    {ENTER}
        Enviar Teclas    {TAB}{TAB}{TAB}{TAB}{TAB}
        Enviar Teclas    {ENTER}
        Enviar Teclas    %a
        Enviar Teclas    %s       
        Enviar Teclas    {ENTER}
        Enviar Teclas    {ENTER}
        Enviar Teclas    {ENTER}
    END

Confirmar Mensagem 
    [Documentation]    Confirma mensagem presente na tela
    [Arguments]    @{mensagem_esperada}
    WHILE    True    limit=10
        ${mensagem}=    Pegar Apenas Mensagem
        Log To Console   Mensagem: ${mensagem}
    
        ${mensagem_verificada}=    Set Variable    ${FALSE}

        FOR    ${mensagem_for}    IN    @{mensagem_esperada}
            Log To Console   Mensagem esperada: ${mensagem_for}
            IF    '${mensagem_for}' in '''${mensagem}'''
                Enviar Teclas    %s
                ${mensagem_verificada}=    Set Variable    ${TRUE}
                BREAK
            END
        END

        IF    ${mensagem_verificada}
            Log To Console    Mensagem encontrada: ${mensagem}
            BREAK
        END
    END

Realizar Login

    [Arguments]    ${USUARIO}    ${SENHA}

    Windows Run    ${APP}

    Control Window    regex:"Configuração de Acesso.*5587"
    Click             name:Continuar

    Wait Until Keyword Succeeds    90s    2s    Ativar Janela

    Send Keys    keys=${USUARIO}
    Send Keys    keys={TAB}
    Send Keys    keys=${SENHA}
    Send Keys    keys={ENTER}

    Wait Until Keyword Succeeds    30s    2s    Ativar Janela

    Send Keys    keys={ENTER}

    Wait Until Keyword Succeeds    30s    2s    Ativar Janela

    Send Keys    keys={ENTER}

    wait until keyword succeeds    30s    2s    Ativar Janela

    send keys    keys={ENTER}

Pegar Mensagem
    [Arguments]    ${trecho}

    ${cmd}=    Set Variable    powershell -NoProfile -Command "Set-Clipboard -Value ' '; $ws = New-Object -ComObject WScript.Shell; $ok = $ws.AppActivate('xpert'); Start-Sleep -Milliseconds 300; if ($ok) { $ws.SendKeys('^c'); Start-Sleep -Milliseconds 300 }; $msg = Get-Clipboard -Raw; if ($msg -like '*${trecho}*') { Write-Output $msg; exit 0 } else { Write-Output $msg; exit 1 }"
    ${r}=      Run Process    ${cmd}    shell=True    stdout=PIPE    stderr=PIPE

    Should Be Equal As Integers    ${r.rc}    0
    ${mensagem}=    Strip String    ${r.stdout}
    RETURN    ${mensagem}

Pegar Apenas Mensagem
    # Cria a string do comando limpando as quebras de linha complexas
    #${powershell_cmd}=    Set Variable    [Clipboard]::Clear(); $ws = New-Object -ComObject WScript.Shell; if ($ws.AppActivate('xpert')) { Start-Sleep -Milliseconds 300; $ws.SendKeys('^c'); Start-Sleep -Milliseconds 500 }; Get-Clipboard -Raw
    ${powershell_cmd}=    Set Variable    Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Clipboard]::Clear(); $ws = New-Object -ComObject WScript.Shell; if ($ws.AppActivate('xpert')) { Start-Sleep -Milliseconds 300; $ws.SendKeys('^c'); Start-Sleep -Milliseconds 500 }; Get-Clipboard -Raw
    
    # Executa passando o comando como argumento direto do executável do powershell
    ${r}=    Run Process    powershell    -NoProfile    -Command    ${powershell_cmd}    stdout=PIPE    stderr=PIPE
    
    ${mensagem}=    Strip String    ${r.stdout}
    RETURN    ${mensagem}

Ativar Janela

    ${cmd}=    Set Variable    powershell -NoProfile -Command "$p = Get-Process -Name AtxExec | Where-Object { $_.MainWindowHandle -ne 0 -and $_.MainWindowTitle -notmatch 'Configuração' } | Sort-Object StartTime -Descending | Select-Object -First 1; if ($null -eq $p) { Write-Output 'False'; exit }; $ws = New-Object -ComObject WScript.Shell; $ok = $ws.AppActivate($p.Id); Start-Sleep -Milliseconds 500; Write-Output ($ok.ToString() + '|' + $p.Id + '|' + $p.MainWindowTitle)"
    ${r}=      Run Process    ${cmd}    shell=True    stdout=PIPE    stderr=PIPE

    ${saida}=    Strip String    ${r.stdout}
    Log To Console    AppActivate retornou: ${saida}
    Should Contain    ${saida}    True

Verificar Mensagens
    #Arguments    ${mensagem}
    ${cmd}=    Set Variable    powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $ok = $ws.AppActivate('xpert'); Write-Output $ok"
    ${r}=      Run Process    ${cmd}    shell=True    stdout=PIPE    stderr=PIPE
    ${saida}=  Strip String    ${r.stdout}
    Should Be Equal    ${saida}    True 

Enviar Teclas
    [Arguments]    ${teclas}
    ${cmd}=    Set Variable    powershell -NoProfile -Command "$p = Get-Process -Name AtxExec | Where-Object { $_.MainWindowHandle -ne 0 -and $_.MainWindowTitle -notmatch 'Configuração' } | Sort-Object StartTime -Descending | Select-Object -First 1; $ws = New-Object -ComObject WScript.Shell; $ws.AppActivate($p.Id); Start-Sleep -Milliseconds 500; $ws.SendKeys('${teclas}')"
    Run Process    ${cmd}    shell=True
