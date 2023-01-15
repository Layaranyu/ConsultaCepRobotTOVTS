*** Settings ***
Resource            ../Base.resource


*** Test Cases ***
Caso de teste 1: Pesquisar um cep válido
    Dado que esteja conectado no site ApiCep
    Quando o usuário consultar o CEP "20250-054" 
    Então deve ser mostrado o endereço "Rua São Carlos - de 481 ao fim - lado ímpar"
    E deve ser mostrado o bairro "Estácio"
    E deve ser mostrada a cidade "Rio de Janeiro"
    E deve ser mostrada a UF "RJ"
    E deve ser mostrado o CEP "20250-054"
    E status code deve ser "200" 
    
Caso de teste 2: Pesquisar um cep invalido
    Dado que esteja conectado no site ApiCep
    Quando o usuário consultar o CEP invalido "33333-334"
    Então a requisição deve falhar e retornar o status "403" 


