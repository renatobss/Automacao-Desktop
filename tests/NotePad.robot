*** Settings ***
Library    RPA.Windows
Library    Process

*** Test Cases ***
Abrir Notepad E Digitar Texto
    #Windows Run    notepad
    Start Process    notepad.exe
    Sleep    2s

    Send Keys    keys=Este texto foi digitado utilizando a biblioteca RPA.Windows.
    Send Keys    keys={ENTER}
    Send Keys    keys=Outra linha de texto com acentuação: café, mãos, próximo.