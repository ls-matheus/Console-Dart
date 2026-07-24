# Estrutura do Sistema de Biblioteca

Documentação do projeto.

---

## Organização do Projeto

O código foi dividido em pastas:

1. **`lib/models/`**: Contém as classes que definem o funcionamento.
2. **`bin/`**: Contém o arquivo principal que roda o programa no terminal.
3. **`Cache/`**: Pasta para armazenar os dados dos livros em um arquivo txt.

---

## Arquivo: `lib/models/livro.dart`

Tem a classe `Livro` com as informações de cada livro.

* **`class Livro`**: Tem um `id`, um `titulo`, um `autor` e a variavel `emprestado`.
* **`paraTexto()`**: Junta os dados do livro em uma linha de texto separada por ponto e virgula para salvar no arquivo.
* **`toString()`**: Mostra os dados formatados na tela.

---

## Arquivo: `lib/models/biblioteca.dart`

Gerencia a lista de livros e salva os dados.

* **`List<Livro> meusLivros = [];`**: Lista que armazena os livros na memoria.
* **`carregarLivros()`**: Le o arquivo `livros.txt` na pasta `Cache`, separa cada linha por ponto e virgula e monta os objetos de livro.
* **`salvarLivros()`**: Percorre a lista de livros e grava cada um como uma linha no arquivo `livros.txt`.
* **`acharPosicao(String cod)`**: Percorre a lista com um `for` e retorna a posicao do livro pelo ID.
* **`cadastrar()`**: Adiciona um novo livro na lista e salva.
* **`listar()`**: Imprime os livros da lista.
* **`buscar()`**: Percorre a lista e compara o titulo digitado com os titulos dos livros.
* **`fazerEmprestimo()` e `devolver()`**: Acham o livro pelo ID e mudam o valor de `emprestado`.
* **`apagar()`**: Acha o livro pelo ID e remove da lista.

---

## Arquivo: `bin/biblioteca.dart`

Arquivo principal que o usuario interage.

* **`void main()`**: Funcao onde o programa inicia.
* **`var sistema = BibliotecaApp();`**: Cria o objeto da biblioteca.
* **`while (rodando)`**: Loop que repete o menu ate o usuario digitar 0.
* **`switch (opcao)`**: Direciona o que fazer de acordo com a opcao escolhida.
* **Espera de 5 segundos**: Usa `sleep(Duration(seconds: 5))` para pausar e dar tempo de ler a resposta antes do menu voltar.
