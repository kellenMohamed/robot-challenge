### robot-challenge ###
#
# Scenario 1: Buy a product in plataforma https://www.saucedemo.com/
# Scenario 2: Cadastrar como Agroespecialista no site da Orbia (https://www.orbia.ag/). 
#
### Setupt ###
# RUn each step below if you don't have robot framework installed priously:
# 1 pip install -U robotframework
# 2 python.exe -m pip install --upgrade pip
# 3 Adicionar na pasta Scripts o chromedriver: AppData\Local\Programs\Python\Python311\Scripts
# 4 pip install robotframework-seleniumlibrary
# 5 pip install robotframework-faker
# 6 pip list (para verificar se o robotframework e o selenium estão instalados)

# Clone this project into C:/GIT
# git clone

#### Execution Story 1 ####
# It is possible to execute all files Or individual execution.

# This first execution is related to buy some products in the https://www.saucedemo.com/ site:
### robot -N “Test Story 1 Happy Flow” -d .results testes\ComprasSauceDemo.robot
# The second execution is related to test invalidat values in Personal Data fields: first and last name, and zipCode.
### robot -N “Test Story 1 unhappy Flow” -d .results testes\ComprasSauceDemo-unhappy.robot

### BUGS Found: ###
| Bug | File                           | Keywords                           | Actual Issue | Expected Result |
| 01  | ComprasSauceDemo-unhappy.robot | Incluir Dados de Postagem unahppy  | Fields First name, last name and zipCode from https://www.saucedemo.com/ website are allowed invalid values | Needs to be applied the validation rules for each field as the story |
| 02  | ComprasSauceDemo-unhappy.robot | Incluir Dados de Postagem unahppy  | After try to continue the flow with all fields empty in "CHECKOUT: YOUR INFORMATION" page if the first name is filled the error message is still showing: 'Error: First Name is required' | After fill one mandatory field the error message should show only the field that is without value |




#### Execution Story 2 ####
# This second execution is related to register new farmer in the https://www.saucedemo.com/ site:
### robot -N “Test Story 1 Happy Flow” -d .results testes\CadastroAgropecuarista.robot

### BUGS Found: ###
| Bug | File                           | Actual Issue | Expected Result |
| 01  | Documentation File             | Está informando queo registro ocorre na opção "“Quero começar" mas essa opção não é encontrada            | -                              |
| 02  | Smoke Test                     | Quando o usário digita um valor invalido do código SMS ao tentar corrigir a cada campo aparece a mensagem de valor invalido | O idela seria permitir o usuário limpar todo o campo e digitar para depois informar se está invalido |
| 03 | Smoke Test                      | Um número de celular não está permitindo ser utilizado em mais de um cadastro | Precisar confirmar a regra de negócio com o business |
| 04 | Smoke Test                      | Quando o usuário tenta criar um login com um email existente aparece essa msg: tesErro ao cadastrar seus dados. Para maiores esclarecimentos ... | Nesse caso poderia ver com o business se a mensagem poderia ser específica uma vez que era apenas alterar o email |


