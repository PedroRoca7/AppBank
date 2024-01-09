# AppBank 
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/PedroRoca7/AppBank/blob/main/LICENSE) 

# Sobre o projeto
AppBank é uma aplicação mobile construída para simular um aplicativo bancário.

<img src="https://github.com/PedroRoca7/AppBank/assets/118369268/3d619184-2bb7-42d8-8286-10660a88bd67" width= "250px"/>

A aplicação consiste em  simular um app bancário, o aplicativo utiliza um sistema de autenticação pelo Firebase, onde o usuário pode se registrar no app e depois efetuar o login para utilizar os recursos do app. Depois de logado o usuário consegue ver seu saldo bancário, extrato onde todas as transações ficam gravadas e também produtos fornecidos pelo banco. Utilizando uma tabBar o usuário consegue navegar entre três telas: Home, Extrato e Produtos.

### Tela de Login ----------------- Tela de Cadastro
<div> 
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/b9f63141-cd3b-4535-b6a9-36b6abb8760c" width= "250px"/>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/7d1bf49e-d9e4-4a29-915e-11267e038a13" width= "250px"/>
</div>

### Home Mostrando Saldo ------- Home Ocultando Saldo
<div> 
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/6516ed93-24ea-4bec-86d9-4661a1a22a0b" width= "250px"/>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/e123cb20-17e4-4cc0-b058-e0c86eeabf68" width= "250px"/>
</div>

Nesta tela é possivel utilizar o botão Pix para simular uma transferência do valor da sua conta para de outra pessoa. Depois de feito a simulação do Pix o mesmo é mostrado na tela de extrato e também atualizado o valor na conta bancária. Toda essa operação utiliza uma API em NodeJs com JSONServer desenvolvida por mim.

### Tela De Pix
<div> 
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/ae9a7928-794c-4f5f-a749-dd492bd9ac58" width= "250px"/>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/27c12800-42b8-412c-968c-a93689e52687" width= "250px"/>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/749f0471-2540-4711-8a28-55d7c8f1e904" width= "250px"/>
</div>

Essa é a tela onde o cliente simula o pix e coloca algumas informções para efetuar a operação. E depois de finalizado a operação ele já pode ver no extrato a mesma.

### Tela De Extrato
<div>
  <div>---------- Filtro "Todos" --------------------- Filtro "Entradas" ------------------ Filtro "Saídas" </div>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/e6abd6be-ce84-4d10-81be-895dd1d9866e" width= "250px"/>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/1f2c6818-0975-4a06-a34f-b50ef9e91e9e" width= "250px"/>
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/ebb8da66-2bd7-47d9-865d-c20469ed77f5" width= "250px"/>
</div>

### Tela De Produtos
<div> 
  <img src="https://github.com/PedroRoca7/AppBank/assets/118369268/87f7bcaf-b67a-4c53-8e78-2c82d174a10a" width= "250px"/>
</div>
Esta é a tela onde o cliente pode acessar os produtos fornecidos pelo banco.

# Tecnologias utilizadas
## Pods
- RxSwift
- RxCocoa
## Autenticação
- Firebase
## Back end
- NodeJs
## Mobile
- Swift
## Implantação
- Banco de dados: Firebase(FireStore)
## App
Pré-requisitos: xCode

# Autor

Pedro Henrique Roca Moreira

https://www.linkedin.com/in/pedro-henrique-roca-moreira
