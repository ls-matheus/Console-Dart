# Estrutura do Sistema de Biblioteca

Esta é a documentação do projeto.

---

## Organização do Projeto

O código foi dividido em pastas:

1. **`lib/models/`**: Contém as classes que definem o funcionamento.
2. **`bin/`**: Contém o arquivo principal que roda o programa no terminal.
3. **`Cache/`**: Pasta para armazenar os dados dos livros em um arquivo txt.

---

## Arquivo: `lib/models/livro.dart`

Este arquivo contém a classe `Livro`.

* **`class Livro`**: Tem um `id`, um `titulo`, um `autor` e a variavel `emprestado`.
* **`toMap()`**: Converte o objeto para salvar em arquivo de texto.
* **`fromMap(...)`**: Faz o inverso, lendo do arquivo e transformando em objeto novamente.
* **`toString()`**: Mostra os dados formatados na tela.

---

## Arquivo: `lib/models/biblioteca.dart`

Gerencia a lista de livros e salva os dados.

* **`List<Livro> meusLivros = [];`**: Lista que armazena os livros na memoria.
* **`carregarArquivos()` e `salvarArquivos()`**:
  * `carregarArquivos` le o arquivo `dados.txt` na pasta `Cache`.
  * `salvarArquivos` salva a lista atual no arquivo `dados.txt`.
* **`cadastrar(Livro l)`**: Adiciona um novo livro.
* **`listar()`**: Imprime os livros da lista.
* **`buscar(...)`**: Filtra a lista de livros pelo nome.
* **`fazerEmprestimo(...)` e `devolver(...)`**: Alteram o estado `emprestado` para verdadeiro ou falso.
* **`apagar(...)`**: Encontra a posicao do livro e remove da lista.

---

## Arquivo: `bin/biblioteca.dart`

Arquivo principal.

* **`void main()`**: Funcao onde o programa inicia.
* **`var sistema = BibliotecaApp();`**: Instancia a classe principal.
* **`while (rodando)`**: Loop continuo para o menu no terminal.
* **`switch (opcao)`**: Direciona o que fazer de acordo com a opcao escolhida.
* **Espera de 5 segundos (`sleep`)**: A funcao `sleep(Duration(seconds: 5))` foi utilizada para pausar e dar tempo de ler a tela antes do menu voltar.
