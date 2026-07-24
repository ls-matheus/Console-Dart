import 'dart:io';
import '../lib/models/book.dart';
import '../lib/models/library.dart';

void main() {
  var library = Library();
  var running = true;

  while (running) {
    print('\n--- Sistema de Biblioteca ---');
    print('1. Cadastrar livro');
    print('2. Listar livros');
    print('3. Pesquisar livro pelo título');
    print('4. Emprestar livro');
    print('5. Devolver livro');
    print('6. Remover livro');
    print('0. Sair');
    print('Escolha uma opção:');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Digite o ID:');
        var id = stdin.readLineSync() ?? '';
        print('Digite o Título:');
        var title = stdin.readLineSync() ?? '';
        print('Digite o Autor:');
        var author = stdin.readLineSync() ?? '';
        if (id.isNotEmpty && title.isNotEmpty && author.isNotEmpty) {
          library.addBook(Book(id, title, author));
        } else {
          print('Dados inválidos.');
        }
        break;
      case '2':
        library.listBooks();
        break;
      case '3':
        print('Digite o título:');
        var title = stdin.readLineSync() ?? '';
        library.searchBook(title);
        break;
      case '4':
        print('Digite o ID do livro para emprestar:');
        var id = stdin.readLineSync() ?? '';
        library.borrowBook(id);
        break;
      case '5':
        print('Digite o ID do livro para devolver:');
        var id = stdin.readLineSync() ?? '';
        library.returnBook(id);
        break;
      case '6':
        print('Digite o ID do livro para remover:');
        var id = stdin.readLineSync() ?? '';
        library.removeBook(id);
        break;
      case '0':
        running = false;
        print('Saindo...');
        break;
      default:
        print('Opção inválida.');
    }
  }
}
