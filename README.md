# Creed Show - Controle de Lotação 2.0

## Sobre o projeto

Aplicativo desenvolvido em Flutter e Dart para a disciplina de **Mobile Application Development**, da FIAP.

**Professor:** Fernando Pinéo  
**Atividade:** Checkpoint 02 

O projeto foi iniciado na CP1, com o objetivo de controlar a quantidade de pessoas presentes em um show, utilizando um contador de entradas e saídas.

Na CP2, evoluímos o aplicativo para permitir o cadastro e o gerenciamento das pessoas que entram e saem do ambiente.

O aplicativo mantém a identidade visual do Creed Show e a capacidade máxima de 50 pessoas.

## Integrantes

**Karen Lucinda Lira Cardoso**  
RM: 566870

**Denise Santos**  
RM: 567559

## Tecnologias utilizadas

- Flutter
- Dart
- Visual Studio Code
- Android Emulator
- Git e GitHub

## Bibliotecas e dependências utilizadas

Durante o desenvolvimento, utilizamos os seguintes pacotes:

| Pacote | Versão no pubspec.yaml | Para que serve |
|---|---|---|
| flutter | SDK | Desenvolvimento do aplicativo e interface |
| cupertino_icons | ^1.0.8 | Disponibiliza ícones no estilo iOS |
| intl | ^0.20.3 | Formatação de data e hora |
| flutter_slidable | ^4.0.3 | Permite deslizar os itens da lista para mostrar ações |
| google_fonts | ^9.0.0 | Permite utilizar fontes personalizadas do Google |
| flutter_test | SDK | Realização de testes automatizados |
| flutter_lints | ^6.0.0 | Verificação de boas práticas no código |
| flutter_launcher_icons | ^0.14.4 | Geração do ícone personalizado do aplicativo |

Os pacotes `flutter_test`, `flutter_lints` e `flutter_launcher_icons` estão nas dependências de desenvolvimento.

## Funcionalidades da CP1

Na primeira versão, desenvolvemos:

- Contador de pessoas no ambiente.
- Botão ENTROU para incrementar a contagem.
- Botão SAIU para diminuir a contagem.
- Capacidade máxima de 50 pessoas.
- Bloqueio dos botões nos limites da contagem.
- Botão para zerar o contador.
- Mensagens conforme a quantidade de pessoas.
- Imagem de fundo e logotipo do CREED.

As mensagens utilizadas são:

| Quantidade | Mensagem |
|---|---|
| 0 a 39 pessoas | Acesse o show |
| 40 a 49 pessoas | Quase lotado! |
| 50 pessoas | Ambiente lotado! |

## Funcionalidades adicionadas na CP2

### 1. Cadastro de pessoas

Agora, para registrar uma entrada, o usuário deve informar:

- Nome da pessoa.
- Identificação ou matrícula.

Utilizamos `TextField` para os campos e `TextEditingController` para obter os valores digitados.

A data e a hora de entrada são registradas automaticamente utilizando `DateTime.now()`.

### 2. Lista de pessoas cadastradas

As pessoas cadastradas aparecem em uma lista utilizando `ListView`.

Cada registro apresenta:

- Nome.
- Identificação.
- Data e hora de entrada.
- Situação: No ambiente ou Saiu.

Para exibir os dados, criamos um widget personalizado chamado `PessoaItem`.

### 3. Controle de entrada e saída

O botão ENTROU cadastra a pessoa e aumenta a quantidade de presentes.

Ao registrar uma saída:

- A situação da pessoa muda para "Saiu".
- A data e a hora de saída são registradas.
- O contador diminui uma pessoa.
- O registro continua aparecendo na lista.

Pessoas que já saíram não podem ter a saída registrada novamente.

### 4. Regras de validação

Foram implementadas as seguintes regras:

- Não permitir cadastro com nome vazio.
- Não permitir cadastro sem identificação.
- Não permitir mais de 50 pessoas presentes.
- Não permitir identificações repetidas entre pessoas que ainda estão no ambiente.
- Não permitir registrar duas vezes a saída da mesma pessoa.
- Ao excluir uma pessoa presente, atualizar a lotação.

### 5. Mensagens para o usuário

Utilizamos `ScaffoldMessenger` e `SnackBar` para informar o resultado das operações.

Exemplos:

- Pessoa cadastrada com sucesso!
- Saída registrada com sucesso!
- Registro excluído com sucesso!
- Preencha o nome e a identificação!
- Ambiente lotado! Entrada não permitida!
- Esta identificação já está no ambiente!

### 6. Confirmação de saída

Utilizamos `AlertDialog` para solicitar uma confirmação antes de registrar a saída.

O usuário pode escolher entre CANCELAR e CONFIRMAR.

### 7. Slidable

Adicionamos o pacote `flutter_slidable`.

Ao deslizar o cartão de uma pessoa para a esquerda, aparecem duas opções:

- **SAÍDA:** registra a saída da pessoa, após confirmação.
- **EXCLUIR:** remove o registro da lista.

### 8. Widget personalizado

Criamos o arquivo `pessoa_item.dart`.

Esse widget recebe um objeto `Pessoa` e funções através do construtor, permitindo a comunicação com a página principal.

Utilizamos os parâmetros `pessoa`, `onSaida` e `onExcluir`.

### 9. Formatação de data e hora

Utilizamos o pacote `intl` e o `DateFormat` para apresentar as datas no formato:

`dd/MM/yyyy HH:mm`

Exemplo: `14/10/2026 19:35`

### 10. Personalização

Mantivemos a identidade visual original do Creed Show, incluindo:

- Logotipo CREED.
- Imagem de fundo.
- Cores personalizadas.
- Botões ENTROU e SAIU.
- Pacote Google Fonts.
- Ícone personalizado do aplicativo.

Para o ícone, utilizamos o pacote `flutter_launcher_icons` e a imagem `assets/img/logo_bg.png`.

## Organização dos arquivos

O projeto foi organizado para separar as responsabilidades:

```text
lib/
├── main.dart
├── models/
│   └── pessoa.dart
├── pages/
│   └── home_page.dart
└── widgets/
    └── pessoa_item.dart

assets/
└── img/
    ├── logo_bg.png
    └── creed_bg.png

test/
└── widget_test.dart

pubspec.yaml
README.md
```

**Descrição dos arquivos:**

- `main.dart`: inicializa o aplicativo.
- `pessoa.dart`: classe que representa uma pessoa.
- `home_page.dart`: tela principal, cadastro, contador e controle de entrada e saída.
- `pessoa_item.dart`: widget que apresenta as pessoas na lista e as ações Slidable.
- `widget_test.dart`: teste automatizado do cadastro e atualização da lotação.
- `pubspec.yaml`: configurações, imagens e dependências.

## Principais conceitos utilizados nas aulas

| Conceito | Utilização |
|---|---|
| StatefulWidget | Tela que precisa atualizar informações |
| StatelessWidget | Widget que apresenta os dados recebidos |
| setState() | Atualiza contador e lista |
| TextField | Entrada de nome e identificação |
| TextEditingController | Obtém os valores digitados |
| ListView | Apresenta a lista de pessoas |
| List | Armazena os objetos cadastrados |
| DateTime | Registra data e hora |
| DateFormat | Formata data e hora |
| ScaffoldMessenger | Exibe mensagens na tela |
| SnackBar | Apresenta feedback |
| AlertDialog | Confirma a saída |
| Navigator | Fecha a janela de confirmação |
| Slidable | Apresenta as ações SAÍDA e EXCLUIR |
| SafeArea e Padding | Organizam a interface |
| SizedBox, Row e Column | Organizam os elementos visuais |
| Expanded e Flexible | Conceitos de organização de layout trabalhados em aula |
| Icon | Exibe ícones |
| Construtor | Recebe informações e funções nos widgets |

## Comandos utilizados no desenvolvimento

| Comando | Finalidade |
|---|---|
| `flutter pub add intl` | Instalar o pacote de formatação de datas |
| `flutter pub add flutter_slidable` | Instalar o Slidable |
| `flutter pub add google_fonts` | Instalar o Google Fonts |
| `flutter pub add --dev flutter_launcher_icons` | Instalar o gerador de ícones |
| `flutter pub get` | Instalar e conferir as dependências |
| `dart run flutter_launcher_icons` | Gerar os ícones do aplicativo |
| `flutter analyze` | Verificar problemas no código |
| `flutter test` | Executar os testes automatizados |
| `flutter run` | Executar o aplicativo |

## Como executar o projeto

1. Clone o repositório do GitHub.
2. Abra a pasta do projeto no Visual Studio Code ou Android Studio.
3. Abra o terminal na pasta do projeto.
4. Execute os seguintes comandos:

```bash
flutter pub get
flutter run
```

Para verificar o código e executar o teste automatizado:

```bash
flutter analyze
flutter test
```

## Testes realizados

Durante o desenvolvimento, utilizamos o Flutter Analyzer e o Flutter Test.

Resultados obtidos em 14/10/2026:

```text
flutter analyze
No issues found!

flutter test
All tests passed!
```

Também realizamos testes visuais do cadastro, contador e apresentação das ações Slidable no aplicativo.

## Evolução da CP1 para CP2

A CP1 foi desenvolvida para controlar a lotação por meio de um contador.

Na CP2, mantivemos o ambiente CREED e acrescentamos o cadastro de pessoas, uma lista de registros, o controle individual de saída, as validações, as mensagens de feedback e as ações de deslizar.

Assim, o aplicativo passou de um contador simples para um sistema de gerenciamento de acessos, utilizando os conceitos de Flutter trabalhados durante as aulas.

## Vídeo de demonstração

**Link do vídeo:** https://youtu.be/VfRHN7fmtHw?is=7WzuxuqdT-Pkvp8R

O vídeo demonstra o funcionamento do aplicativo, incluindo cadastro de pessoas, controle da lotação, registro de saída, validações e as opções SAÍDA e EXCLUIR do Slidable.

Duração máxima exigida: 5 minutos.

---

Projeto desenvolvido para fins acadêmicos — FIAP, 2026.

**Checkpoint 02 — Mobile Application Development**
