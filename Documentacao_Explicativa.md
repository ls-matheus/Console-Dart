# Documentação do Sistema de Biblioteca

Esta é a documentação do projeto, contendo a explicação da arquitetura e o funcionamento de cada parte do código desenvolvido.

---

## 1. Organização do Projeto (Arquitetura)

O código foi dividido em duas pastas principais para manter a organização:

1. **`lib/models/`**: Contém as classes que definem a estrutura e a lógica de funcionamento do sistema.
2. **`bin/`**: Contém o arquivo principal (`biblioteca.dart`) responsável por rodar o programa e exibir o menu interativo no terminal.
3. **`Cache/`**: Diretório utilizado para armazenar os dados dos livros em um arquivo de texto, servindo como uma persistência de dados local.

---

## 2. Estrutura do arquivo: `lib/models/book.dart`

Este arquivo contém a classe que define a estrutura de um livro.

* **`class Book`**: Define que cada livro no sistema possui um `id`, um `title` (título), um `author` (autor) e uma variável booleana `isBorrowed` (indicando se o livro está emprestado).
* **`Book(this.id, ...)`**: O construtor da classe, responsável por instanciar um novo livro com as informações fornecidas.
* **`toMap()`**: Converte o objeto do livro para uma estrutura de mapa (chave e valor), permitindo que os dados sejam posteriormente convertidos em formato JSON e salvos no arquivo de texto.
* **`Book.fromMap(...)`**: Realiza o processo inverso, recebendo um mapa (leitura do arquivo) e instanciando um objeto do tipo Book novamente.
* **`toString()`**: Sobrescreve o método padrão para exibir as informações do livro de forma formatada quando impresso no terminal.

---

## 3. Estrutura do arquivo: `lib/models/library.dart`

Este arquivo gerencia a lógica principal e a coleção de livros.

* **`List<Book> books = [];`**: Uma lista em memória que armazena os livros carregados enquanto a aplicação está em execução.
* **`_loadBooks()` e `_saveBooks()`**:
  * O método `_loadBooks` é executado ao inicializar a classe. Ele lê o arquivo `books.txt` no diretório `Cache` e carrega os objetos para a memória.
  * O método `_saveBooks` serializa a lista atual de livros para o formato JSON e sobrescreve o arquivo `books.txt`. Ele é chamado após qualquer modificação nos dados (cadastro, remoção, empréstimo, etc.).
* **`addBook(Book book)`**: Adiciona um novo objeto de livro à lista e persiste a alteração.
* **`listBooks()`**: Itera sobre a lista de livros em memória e imprime cada um no console.
* **`searchBook(...)`**: Filtra a lista de livros comparando o título buscado com os títulos existentes, ignorando a diferença entre maiúsculas e minúsculas.
* **`borrowBook(...)` e `returnBook(...)`**: Buscam o livro pelo ID e alteram o estado da propriedade `isBorrowed` para verdadeiro ou falso, persistindo a alteração na sequência.
* **`removeBook(...)`**: Encontra a posição do livro na lista através do ID e o remove, salvando o novo estado no arquivo.

---

## 4. Estrutura do arquivo: `bin/biblioteca.dart`

Este arquivo é o ponto de entrada da aplicação, responsável pela interação com o usuário via terminal.

* **`void main()`**: A função principal obrigatória na linguagem Dart, onde a execução do programa se inicia.
* **`var library = Library();`**: Instancia a classe principal do sistema para possibilitar o uso de seus métodos.
* **`while (running)`**: Um laço de repetição (loop) contínuo que mantém o menu ativo e sendo reexibido até que a variável `running` torne-se falsa.
* **`switch (choice)`**: Estrutura de controle que direciona o fluxo da aplicação de acordo com a opção escolhida pelo usuário (1 a 6).
* **Delay de 5 segundos (`sleep`)**: A função `sleep(Duration(seconds: 5))` foi utilizada para pausar a execução após uma operação, permitindo que o usuário tenha tempo hábil para ler a resposta da ação antes que o menu seja impresso na tela novamente.
