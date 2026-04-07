#Sessão para configuração, documentacao, imports de arquivos e librarys
* Settings *
Documentation   Ações e variáveis para o endpoint /login.
Resource        ../support/base.robot
 


#Sessão para criacao de Keywords Personalizadas
* Keywords *
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Keyword para realizar o login
POST Endpoint /login    
    ${response}     POST on Session      serverest         /login   json=&{payload}     expected_status=anything                        
    #Condição para verificar se o login foi realizado com sucesso para coletar o token
    IF    ${response.status_code} == 200
        ${token_auth}    Set Variable      ${response.json()["authorization"]}   
        Set Global Variable     ${token_auth} 
           
    END
    SET Global Variable     ${response}
#Imprimir conteudo da resposta no console
Imprimir Login Response.Content
    IF  ${response.status_code} == 200 or ${response.status_code} == 201 
            Log to console     ${yellow}Resposta para Login de Usuario:${yellow} ${green}${response.content}${green}
        ELSE
            Log to console     ${yellow}Resposta para Login de Usuario:${yellow} ${red}${response.content}${red} 
    END   
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Login Válido com dados estatitcos
POST Login Valido Usando FUNCAO
    ${json}     login_padrao
    ${payload}  SET Variable     ${json}
    Set Global Variable     ${payload}
    POST Endpoint /login
#validando a mensagem de sucesso
Resposta Login Valido
    Should Be Equal    ${response.json()["message"]}    Login realizado com sucesso 
    Should not be empty    ${response.json()["authorization"]}
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Login invalido com dados dinamicos
POST Login Dinamico Invalido 
    ${payload}      Criar Dados Dinamicos Login Invalido
    Set Global Variable     ${payload}
    POST Endpoint /login
#validando a mensagem de erro de email ou senha
Resposta Login Invalido   
    Should Be Equal    ${response.json()["message"]}    Email e/ou senha inválidos
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Login invalido com dados dinamicos SEM SENHA
POST Login Dinamico Sem Senha
    ${payload}      Criar Dados Dinamicos Login Sem Senha
    Set Global Variable     ${payload}
    POST Endpoint /login
#validando a mensagem de erro senha em branco    
Resposta Login Sem Senha   
    Should Be Equal    ${response.json()["password"]}    password não pode ficar em branco     
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Login invalido com dados dinamicos SEM EMAIL
POST Login Dinamico Sem Email
    ${payload}      Criar Dados Dinamicos Login Sem Email
    Set Global Variable     ${payload}
    POST Endpoint /login
#validando a mensagem de erro email em branco    
Resposta Login Sem Email  
    Should Be Equal    ${response.json()["email"]}    email não pode ficar em branco
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# POST login especial para usuario Administrador false
POST Login Estatico Login Administrator False
    ${json}     Importar Json Estatico  massa_login.json
    ${payload}  SET Variable     ${json["login_adm_false"]}
    Set Global Variable     ${payload}
    POST Endpoint /login
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#login para usuario exluido antes de POST PRODUTO ou POST CARRINHO
POST Login Usuario Excluido
    ${json}     Importar Json Estatico  massa_login.json
    ${payload}  SET Variable     ${json["login_usuario_excluido"]}
    Set Global Variable     ${payload}
    POST Endpoint /login


