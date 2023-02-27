### robot-challenge ###

# Scenario 1: Buy a product in plataforma https://www.saucedemo.com/
# Scenario 2: Cadastrar como Agroespecialista no site da Orbia (https://www.orbia.ag/). 
#
### Setut ###
# RUn each step below if you don't have robot framework installed priously:
# 1 pip install -U robotframework
# 2 python.exe -m pip install --upgrade pip
# 3 Adicionar na pasta Scripts o chromedriver: AppData\Local\Programs\Python\Python311\Scripts
# 4 pip install robotframework-seleniumlibrary
# 5 pip install robotframework-faker
# 6 pip list (para verificar se o robotframework e o selenium estão instalados)

# Clone this project into C:/GIT
# git clone

##
### Command to execut all tests below: robot -N -d testes

### Na pasta .results estão os reports e screenshots das execuções

#### Execution Story 1 ####
# It is possible to execute all files Or individual execution.

# This first execution is related to buy some products in the https://www.saucedemo.com/ site:
### robot -N “Test Story 1 Happy Flow” -d .results testes\ComprasSauceDemo.robot
# The second execution is related to test invalida values in Personal Data fields: first and last name, and zipCode.
### robot -N “Test Story 1 unhappy Flow” -d .results testes\ComprasSauceDemo-unhappy.robot

# The third execution is related to test invalida values for user ands password(pws) fields
### robot -N “Test Story 1 unhappy Flow” -d .results testes\LoginSauceDemo-unhappy.robot


### BUGS Found story 1: ###
| Bug | File                           | Keywords                           | Actual Issue | Expected Result |
| 01  | ComprasSauceDemo-unhappy.robot | Incluir Dados de Postagem unahppy  | Fields First name, last name and zipCode from https://www.saucedemo.com/ website are allowed invalid values | Needs to be applied the validation rules for each field as the story |
| 02  | ComprasSauceDemo-unhappy.robot | Incluir Dados de Postagem unahppy  | After try to continue the flow with all fields empty in "CHECKOUT: YOUR INFORMATION" page if the first name is filled the error message is still showing: 'Error: First Name is required' | After fill one mandatory field the error message should show only the error message for the field that is without valid value |
| 03  | A mensagem para login invalido é unfriendly | Seria ideal alinhar com o business e definir uma mensagem apropriada |
| 04  | Ao tentar buscar o elemento da mensagem do item 3 está sendo retornado o seguinte erro a ser analisado: "Failed to read descriptor from node connection: Um dispositivo conectado ao sistema nÒo estß funcionando. (0x1F)" |




#### Execution Story 2 ####

# This third execution is related to orbia website (But needs to add more flows)
### robot -N “Test Story 2 Happy Flow” -d .results testes\CadastroAgroespecialista.robot

### BUGs Found Story 2: ###
| Bug | File                           | Actual Issue | Expected Result |
| 01  | Documentation File             | Está informando queo registro ocorre na opção "“Quero começar" mas essa opção não é encontrada            | -                              |
| 02  | Smoke Test                     | Quando o usário digita um valor invalido do código SMS ao tentar corrigir a cada campo aparece a mensagem de valor invalido | O ideal seria permitir o usuário limpar todo o campo e digitar para depois informar se está invalido |
| 03 | Smoke Test                      | Um número de celular não está permitindo ser utilizado em mais de um cadastro | Precisar confirmar a regra de negócio com o business |
| 04 | Smoke Test                      | Quando o usuário tenta criar um login com um email existente aparece essa msg: tesErro ao cadastrar seus dados. Para maiores esclarecimentos ... | Nesse caso poderia ver com o business se a mensagem poderia ser específica uma vez que era apenas alterar o email |


#### Execution Story 2 - Test 2 ####

# This Fourth execution is related to orbia website (But needs to discover some issues)
### robot -N “Test Story 2 Happy Flow” -d .results testes\CotarInsumos.robot


### Notes about story 2: ###
Foram criados 2 arquivos de testes para o site orbia que precisam ser concluídos pois existem algumas dúvidas:
| 01 | "Arquivo CotarInsumos.robot" - duvida sobre como anexar o arquivo pois os comandos do robot não permitram |
" 02 | Dúvida do porque ao selecionar o estado o campo cidade não está sendo carregado mesmo se incluir uma espera |
| 03 | Seria ideal uma padronização de elementos pois ao inspecionar é possível nota nomes muito genéricos como: "id="btnAzul"" ---> O mesmo para a story 1 |

