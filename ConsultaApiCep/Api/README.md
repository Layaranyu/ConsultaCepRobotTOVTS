## Robot Framework
O [Robot Framework](https://robotframework.org/) é um framework baseado em Python, que permite usar abordagens keyword-driven, data-driven e/ou behaviour-driven (BDD). Possui sintaxe de dados tabular fácil de usar e permite que usuários utilizem e criem bibliotecas em Python ou Java.


| Pasta             | Descrição                                                           |
| ----------------- | ----------------------------------------------------------------    |
| JSON              | Contem o JSON utilizado no teste                                    |
| Resources         | Contem os arquivos com as keywords/locators e libraries dos testes  |
| Results           | Contem os arquivos com os logs gerados dos resultados dos testes    |
| Tests             | Contem os arquivos com os casos de testes escrito em Gherkin        |
| Variables         | Contem os arquivos com as variáveis dos testes                      |

###### Configuração NECESSÁRIA ######

## VSCode
Para instalar o VSCODE será necessário baixar o instalador acessando o site oficial [nesse link](https://code.visualstudio.com)
1. Clique duas vezes no instalador para iniciar o assistente de instalação do VSCode.
2. Quando abrir o instalador marque a opção "Eu aceito o acordo" e clique em próximo.
3. Verifique se as opções "adicione em PATH (Disponível após reiniciar)" e "Registre Code como editor para tipos de arquivos suportados" estão marcados, se não tiver marque e clique em próximo.
4. Após a instalação clique em concluir.

## Extensão Robot Framework no VSCODE
Com o VSCODE aberto clique na aba de extensões na lateral esquerda da tela e procure pela extensão "Robot Code" de Daniel Biehl e instale, essa extensão será necessária para reconhecer e realizar a marcação da sintaxe do robot framework 

## Python
Para instalar o Python será necessário baixar o instalador acessando o site oficial [nesse link](https://www.python.org/downloads/) e clicando em download Python.
1. Clique duas vezes no instalador para iniciar o assistente de instalação do python.
2. Quando abrir o instalador marque a opção "Add Python to PATH".
3. Clique em "Install Now".
4. Após o processo de instalação clique em close para fechar o instalador.


## Instalação Robot Framework
Para instalação o robot framework é necessário que siga os passos abaixo e certifique-se que o Python está instalado.

1. Execute o Windows Terminal como *Administrador*
2. Navegue até onde está a pasta que contém o projeto de Consulta ApiCep
3. Copie o comando abaixo e tecle Enter 

Para instalar o robot framework:
```
pip install robotframework==5.0.1
```

Para instalar as bibliotecas auxiliares:
```
pip install robotframework-requests==0.9.3
```
```
pip install robotframework-jsonlibrary==0.5 
```

## Rodando teste COMPLETO

1. No VSCode abra o terminal no caminho da pasta Tests
2. Copie o comando abaixo e tecle Enter

```
robot -d ../Results  PesquisarCep.robot
```
## Relatório de execução de testes
Após a execução de comando para executar o teste, os resultados ficam armazenados em um arquivo de relatório na pasta Results com arquivo log.html.

## Desafio de consulta de cep 

Descrição da demanda:
	Foi verificado a necessidade de realizar testes na api de consulta de ceps do site apiceps.com para poder verificar a integridade da api como a sua resposta de requisição e seu status.

Solução proposta
	A ferramenta escolhida para realização do teste foi o robot framework onde será feita a requisição utilizando casos de testes em sintaxe gherkin e no final de cada teste será realizado validação das respostas das requisições. Algumas das bibliotecas escolhidas para fazer os testes são: 	
Requests Library – Ela possibilita o robot framework fazer requisições com apis.
Collections Library- Essa biblioteca permite o robot framework fazer manipulações e validações de dicionários.
Json Library- Essa biblioteca permite o robot framework fazer manipulação, importação e exportação de Json.
Operation System- é utilizada para importar arquivos para o teste, dentre outra funcionalidade do SO.

Cenários de testes

I-Pesquisar um cep válido 
Teste 1- Realizar a requisição com o cep válido e verificar se a resposta da requisição traz os dados de acordo com o endereço real.

Dado que esteja conectado no site ApiCep
Quando o usuário consultar o CEP "20250-054" 
Então deve ser mostrado o endereço "Rua São Carlos - de 481          ao fim - lado ímpar"
E deve ser mostrado o bairro "Estácio"
E deve ser mostrada a cidade "Rio de Janeiro"
E deve ser mostrada a UF "RJ"
E deve ser mostrado o CEP "20250-054"
E status code deve ser "200"

II- Pesquisar com um cep inválido
Teste 2- Realizar a requisição com o cep inválido e a requisição deve falhar e retornar o status 403.

Dado que esteja conectado no site ApiCep
Quando o usuário consultar o CEP invalido "33333-334"
Então a requisição deve falhar e retornar o status "403"
