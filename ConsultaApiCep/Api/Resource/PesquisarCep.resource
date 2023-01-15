*** Settings ***
Resource     ../Base.resource


*** Keywords ***
Dado que esteja conectado no site ApiCep
    Create Session    ApiCep    ${URL} 

Quando o usuário consultar o CEP "${CEP}"
    ${CEP}    Catenate    ${CEP}.json
    ${RESPONSE_CONSULTA_CEP}    GET On Session     ApiCep      ${CEP}
    Set Test Variable    ${RESPONSE_CONSULTA_CEP}

Então deve ser mostrado o endereço "${ENDEREÇO}"
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA_CEP.json()}    address       ${ENDEREÇO}
E deve ser mostrado o bairro "${BAIRRO}"
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA_CEP.json()}    district      ${BAIRRO}
E deve ser mostrada a cidade "${CIDADE}"
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA_CEP.json()}    city          ${CIDADE}
E deve ser mostrada a UF "${ESTADO}"
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA_CEP.json()}    state         ${ESTADO}

E deve ser mostrado o CEP "${CEP}"
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA_CEP.json()}    code          ${CEP}
E status code deve ser "${STATUS_CODE}"
    ${JSON_CEP_VALIDO}    Get File    ../JSON/CepValido.json
    ${JSON_CEP_VALIDO}    Convert String To Json    ${JSON_CEP_VALIDO} 
    Dictionaries Should Be Equal      ${RESPONSE_CONSULTA_CEP.json()}                  ${JSON_CEP_VALIDO}
    Should Be Equal As Strings       ${RESPONSE_CONSULTA_CEP.status_code}               ${STATUS_CODE}
Quando o usuário consultar o CEP invalido "${CEP}"
    ${CEP}    Catenate    ${CEP}.json
    ${RESPONSE_CONSULTA_CEP}    GET On Session     ApiCep      ${CEP}
    ...                                                        expected_status=403
    Set Test Variable    ${RESPONSE_CONSULTA_CEP} 

Então a requisição deve falhar e retornar o status "${STATUS_403}"
    Status Should Be    ${STATUS_403}        response=${RESPONSE_CONSULTA_CEP}

    


        
    