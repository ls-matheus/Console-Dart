# 📚 Documentação do Sistema de Biblioteca (Fácil de Entender)

Aqui está a explicação passo a passo, pensada para que você possa entender **tudo** o que fizemos e conseguir apresentar ou explicar o projeto para qualquer pessoa!

---

## 📂 1. Como organizamos o projeto? (Arquitetura)

Para não ficar tudo uma bagunça em um único arquivo, dividimos o código em **duas pastas principais**:

1. **`lib/models/`**: Aqui ficam os "moldes" do nosso sistema. É a parte inteligente que diz *o que é um livro* e *como a biblioteca funciona*.
2. **`bin/`**: Aqui fica o arquivo principal (`biblioteca.dart`) que roda o programa e mostra aquele menu no terminal.
3. **`Cache/`**: Essa é a pastinha que guarda os nossos livros salvos no computador, como se fosse um banco de dados em formato de texto para não perdermos os dados.

---

## 📖 2. Explicando o arquivo: `lib/models/book.dart`

Esse arquivo é como se fosse a "certidão de nascimento" de um livro. Na programação Orientada a Objetos (POO), chamamos isso de **Classe**.

* **`class Book { ... }`**: Criamos a classe `Book` (Livro). Ela diz que todo livro no nosso sistema obrigatoriamente tem um `id`, um `title` (título), um `author` (autor) e um `isBorrowed` (se está emprestado ou não).
* **`Book(this.id, ...)`**: Isso é o "Construtor". É uma maquininha que pega as informações que digitamos no terminal e cria o objeto do livro de verdade.
* **`toMap()`**: Pega o nosso Livro (que só o Dart entende) e transforma num formato de "dicionário/mapa" de texto para podermos salvar no arquivo `.txt` da pasta Cache.
* **`Book.fromMap(...)`**: Faz o contrário! Pega o texto que estava salvo no arquivo `.txt` e transforma de volta num Livro de verdade quando abrimos o programa.
* **`toString()`**: Serve apenas para formatar como o livro vai aparecer na tela quando mandarmos imprimir (colocando as barrinhas verticais e dizendo "Sim" ou "Não" para emprestado).

---

## 🏛️ 3. Explicando o arquivo: `lib/models/library.dart`

Esse arquivo é o "Cérebro" da nossa biblioteca. É ele quem gerencia a lista de livros e faz o trabalho pesado.

* **`List<Book> books = [];`**: Criamos uma lista (como se fosse uma prateleira vazia) para guardar todos os nossos livros na memória enquanto o programa roda.
* **`_loadBooks()` e `_saveBooks()`**:
  * Quando a biblioteca é "ligada", o `_loadBooks` vai na pasta secreta `Cache`, abre o arquivo `books.txt`, lê o que está lá dentro e coloca os livros de volta na prateleira.
  * O `_saveBooks` faz o inverso: sempre que a gente faz alguma mudança (cadastra, remove, etc), ele pega a prateleira inteira e guarda no arquivo `books.txt` para não perdermos nada se fechar o programa.
* **`addBook(Book book)`**: Pega um livro novo, coloca na lista (prateleira) e chama o `_saveBooks` para salvar no PC.
* **`listBooks()`**: Simplesmente faz um laço de repetição (um `for`) que passa por todos os livros da prateleira imprimindo um por um.
* **`searchBook(...)`**: Procura um livro. Ele filtra a lista comparando o que você digitou com os títulos dos livros (ignorando letras maiúsculas/minúsculas para facilitar).
* **`borrowBook(...)` e `returnBook(...)`**: Eles procuram o livro pelo ID e mudam o "status" dele (`isBorrowed = true` para emprestado, e `false` para devolvido). Depois, salvam no PC.
* **`removeBook(...)`**: Acha a posição do livro na prateleira pelo ID e apaga ele da lista (depois salva no PC).

---

## 🖥️ 4. Explicando o arquivo: `bin/biblioteca.dart`

Esse é a porta de entrada. É o arquivo que lida com você (o usuário).

* **`void main()`**: O Dart sempre procura essa palavra `main` para saber por onde o programa começa. Sem ela, o código não roda.
* **`var library = Library();`**: Aqui a gente "inicia" a nossa biblioteca para poder usar as funções dela.
* **`while (running)`**: É um "loop" infinito. Ele garante que o menu continue aparecendo na tela várias vezes até você escolher a opção de sair (`0`), que quebra o loop.
* **`switch (choice)`**: É um painel de controle. Ele pega a opção que você digitou no menu (`1, 2, 3...`) e direciona para a ação correta. 
  * Exemplo: se você digitar `1`, ele pede o ID, Título e Autor, e então envia essas palavras para o cérebro da biblioteca em `library.addBook()`.
* **A espera de 5 segundos (`sleep`)**: Toda vez que ele termina de executar uma ação (como listar os livros), usamos o comando `sleep(Duration(seconds: 5))` para "congelar" o tempo por 5 segundos. Assim você tem tempo para ler a resposta antes que o menu apague e apareça de novo.
