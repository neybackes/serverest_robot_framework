*** Settings ***
Documentation    Keyword e Variaves para acoes gerais
       





*** Variables ***




*** Keywords ***
   
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------    

# Iniciar Sessão Serverest 
Criar Sessao                                                        
    Create Session  serverest   ${base_uri}
   

      


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Validar o Status Code da Resposta
validar Status Code "${statuscode}"    
    Should Be true     ${response.status_code} == ${status_code} 
    IF  ${response.status_code} == 200 or ${response.status_code} == 201 
        Log to console     ${yellow}Status Code Retornado:${yellow} ${green}${response.status_code}${green}
    ELSE
        Log to console     ${yellow}Status Code Retornado:${yellow} ${red}${response.status_code}${red} 
    END


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Keyword para importa o arquivo json
Importar Json Estatico  
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File    ${EXECDIR}/support/fixtures/estatic/${nome_arquivo}
    ${data}         Evaluate    json.loads('''${arquivo}''')    json
    [Return]        ${data}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Keyword de cores para o log de console
#Artigo no StackOverflor que me ajudou a montar a keyword
#https://stackoverflow.com/questions/35652486/how-can-i-put-colors-in-console-output-with-robot-framework
Iniciar cores de resposta
  ${red}=  Evaluate  ${RED}
  Set Test Variable  ${red}
  ${yellow}=  Evaluate  ${YELLOW}  
  Set Test Variable  ${yellow}
  ${green}=  Evaluate  ${GREEN}  
  Set Test Variable  ${green}