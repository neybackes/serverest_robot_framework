*** Settings ***
Documentation    Keyword e Variaves para geração de dados dinamicos
Library          FakerLibrary



*** Keywords ***
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Dados dinamicos para login de usuario
Criar Dados Dinamicos Login Invalido
    ${email}            FakerLIbrary.Email
    ${password}         FakerLibrary.Password
    ${payload}          Create Dictionary        email=${email}    password=${password}
    [return]            ${payload}

Criar Dados Dinamicos Login Sem Senha
    ${email}            FakerLIbrary.Email    
    ${payload}          Create Dictionary        email=${email}    password=
    [return]            ${payload}

Criar Dados Dinamicos Login Sem Email    
    ${password}         FakerLibrary.Password
    ${payload}          Create Dictionary        email=    password=${password}
    [return]            ${payload}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Dados dinamicos para cadastro de usuario
Criar Dados Dinamicos Cadastro Valido
    ${nome}             FakerLibrary.Name
    ${email}            FakerLIbrary.Email
    ${password}         FakerLibrary.Password
    ${payload}          Create Dictionary        nome=${nome}      email=${email}     password=${password}     administrador=true
    [return]            ${payload}


Criar Dados Dinamicos Cadastro Email Repetido
    ${nome}             FakerLibrary.Name
    ${email}            FakerLIbrary.Email
    ${password}         FakerLibrary.Password
    ${payload}          Create Dictionary        nome=${nome}      email=fulano@qa.com.br    password=${password}     administrador=true
    [return]            ${payload}


Criar Dados Dinamicos para Alteracao Valido
    ${nome}             FakerLibrary.Name
    ${email}            FakerLIbrary.Email
    ${password}         FakerLibrary.Password
    ${payload}          Create Dictionary        nome=${nome}      email=${email}     password=${password}     administrador=true
    [return]            ${payload}


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


