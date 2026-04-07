#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *
Documentation   Ações e variáveis para o endpoint /usuarios
Resource        ../support/base.robot
       


#Sessão para criacao de Keywords Personalizadas
* Keywords *
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Keyword para realizar o cadastro de usuario
POST Endpoint /usuarios
    ${response}     POST on Session      serverest         /usuarios  json=&{payload}     expected_status=anything
    SET Global Variable     ${response}            
    IF    ${response.status_code} == 201
        ${user_id}      SET Variable     ${response.json()["_id"]}  
        Set Global Variable     ${user_id}        
    END  
    
#Imprimir conteudo da resposta no console
Imprimir Usuario Response.Content
   IF  ${response.status_code} == 200 or ${response.status_code} == 201 
            Log to console     ${yellow}Resposta para Cadastro de Usuario:${yellow} ${green}${response.content}${green}
        ELSE
            Log to console     ${yellow}Resposta para Cadastro de Usuario:${yellow} ${red}${response.content}${red} 
    END

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
# Cadastro de Usuario com dados dinamicos
POST Cadastro Usuario Dinamico Valido
    ${payload}      Criar Dados Dinamicos Cadastro Valido
    Set Global Variable     ${payload}
    POST Endpoint /usuarios

Resposta Usuario Cadastrado  
    Should Be Equal  ${response.json()["message"]}       Cadastro realizado com sucesso        
    Should not be empty    ${response.json()["_id"]} 
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Cadastro de Usuario Email Repetido com dados dinamicos
POST Cadastro Usuario Dinamico Email Repetido
    ${payload}      Criar Dados Dinamicos Cadastro Email Repetido
    Set Global Variable     ${payload}
    POST Endpoint /usuarios
Resposta Usuario Email Repetido
    Should Be Equal    ${response.json()["message"]}    Este email já está sendo usado
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Cadastro de usuario estatico
POST Cadastro Usuario Estatico Valido
    ${json}     Importar Json Estatico  massa_user.json
    ${payload}  SET Variable     ${json["user_estatico_para_cadastro"]}    
    Set Global Variable     ${payload}    
    POST Endpoint /usuarios  
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

#Cadastro de usario estatico ADM false
POST Cadastro Usuario Estatico ADM False
    ${json}     Importar Json Estatico  massa_user.json
    ${payload}  SET Variable     ${json["user_para_administrador_false"]}    
    Set Global Variable     ${payload}    
    POST Endpoint /usuarios  

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Buscando todos os usuarios
GET Endpoint /usuarios
    ${response}     GET on Session      serverest         /usuarios    
    Set Global Variable     ${response}        
    Log To Console  ${yellow}Resposta para Usuarios Cadastrados:${yellow} ${green}${response.content}${green}

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Bucando usuario por id
GET Endpoint FUNCAO /usuarios/_id
    ${json}        buscar usuario       
    ${response}    GET on Session      serverest         /usuarios/${json}  
    Set Global Variable     ${response}
    Log to console     ${yellow}Resposta para Usuario Cadastrados ID:${yellow} ${green}${response.content}${green}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
#Buscando usuario por ID inexistente
GET Endpoint Estatico /usuarios/_id Nao Encontrado
    ${response}     GET on Session      serverest         /usuarios/semid  expected_status=anything
    Set Global Variable     ${response}
    Log to console     ${yellow}Resposta Usario Não Encontrado:${yellow} ${red}${response.content}${red}    
Resposta Usuario Não Encontrado  
    Should Be Equal    ${response.json()["message"]}    Usuário não encontrado
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

#Keyword para alterar um cadastro de usuario 
PUT Endpoint /usuarios
    ${response}     PUT on Session      serverest         /usuarios/${user_id}   json=${payload}    expected_status=anything    
    IF  ${response.status_code} == 200 or ${response.status_code} == 201 
        Log to console     ${yellow}Resposta para Atualizacao de Cadastro:${yellow} ${green}${response.content}${green}
    ELSE
        Log to console     ${yellow}Resposta para Atualizacao de Cadastro Email Repetido:${yellow} ${red}${response.content}${red} 
    END
    IF    ${response.status_code} == 201
        ${user_id}      SET Variable     ${response.json()["_id"]}  
        Set Global Variable     ${user_id}        
    END     
    SET Global Variable     ${response}    
    
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    

# Alteração Usuario com dados dinamicos
PUT Alterar Cadastro Usuario Diamico Valido
    ${payload}      Criar Dados Dinamicos para Alteracao Valido
    Set Global Variable     ${payload}
    PUT Endpoint /usuarios
Resposta Cadastro Usuario Alterado
    Should Be Equal    ${response.json()["message"]}    Registro alterado com sucesso
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
# Alterar cadsatro com usuario sem ID
PUT Alterar Usuario Diamico Valido Sem ID
    ${payload}      Criar Dados Dinamicos para Alteracao Valido
    Set Global Variable     ${payload}
    ${user_id}      SET Variable     semid
    ${user_id}      SET Global Variable     ${user_id}
    PUT Endpoint /usuarios
Resposta Cadastro Usuario Sem ID
    Should Be Equal    ${response.json()["message"]}    Cadastro realizado com sucesso
    Should not be empty    ${response.json()["_id"]} 
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
# Alterar cadastro com email repetido 

PUT Alterar Cadastro Usuario Diamico Email Repetido
    ${payload}      Criar Dados Dinamicos Cadastro Email Repetido
    Set Global Variable     ${payload}   
    PUT Endpoint /usuarios
Resposta Cadastro Usuario Email Repetido
    Should Be Equal    ${response.json()["message"]}    Este email já está sendo usado  

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
# Delete Usario por ID

DELETE Endpoint /usuarios
    #[Arguments]     ${_id}
    ${response}     DELETE on Session      serverest         /usuarios/${user_id}   expected_status=anything
    SET Global Variable     ${response}

Resposta Delete Usuario
    Should Be Equal    ${response.json()["message"]}    Registro excluído com sucesso

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
# DELete Usuario por ID inexistente
DELETE Endpoint /usuarios Nao Encontrado
    #[Arguments]     ${_id}
    ${response}     DELETE on Session      serverest         /usuarios/semid     expected_status=anything
    SET Global Variable     ${response}
Resposta Delete Usuario ID inexistente
    Should Be Equal    ${response.json()["message"]}     Nenhum registro excluído

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
# Delete USUARIO com carrinho cadastrado 
DELETE Endpoint /usuarios Carrinho Cadastrado
    ${json}         buscar usuario
    ${response}     DELETE on Session      serverest         /usuarios/${json}   expected_status=anything
    SET Global Variable     ${response}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
# Resposta Carrinho Cadastrado 
Resposta Delete Usuario Carrinho Cadastrado
    Should Be Equal    ${response.json()["message"]}     Não é permitido excluir usuário com carrinho cadastrado
    Should not be empty    ${response.json()["idCarrinho"]}    

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
#imprimor no console o retorno DELETE 
Imprimir Delete Usuario Response.Content
    Log to console     ${yellow}Resposta para Usuario Deletado:${yellow} ${red}${response.content}${red}   
    







  
