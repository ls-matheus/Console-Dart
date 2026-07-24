import 'dart:convert';
import 'dart:io';
import 'book.dart';

class Library {
  List<Book> books = [];
  final String _cachePath = 'Cache/books.txt';

  Library() {
    _loadBooks();
  }

  void _loadBooks() {
    var file = File(_cachePath);
    if (file.existsSync()) {
      var contents = file.readAsStringSync();
      if (contents.isNotEmpty) {
        List<dynamic> jsonList = jsonDecode(contents);
        books = jsonList.map((item) => Book.fromMap(item)).toList();
      }
    }
  }

  void _saveBooks() {
    var directory = Directory('Cache');
    if (!directory.existsSync()) {
      directory.createSync();
    }
    var file = File(_cachePath);
    var jsonList = books.map((b) => b.toMap()).toList();
    file.writeAsStringSync(jsonEncode(jsonList));
  }

  void addBook(Book book) {
    books.add(book);
    _saveBooks();
    print('Livro "${book.title}" cadastrado com sucesso!');
  }

  void listBooks() {
    if (books.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }
    for (var book in books) {
      print(book);
    }
  }

  void searchBook(String title) {
    var foundBooks = books.where((b) => b.title.toLowerCase().contains(title.toLowerCase())).toList();
    if (foundBooks.isEmpty) {
      print('Livro não encontrado.');
      return;
    }
    for (var book in foundBooks) {
      print(book);
    }
  }

  void borrowBook(String id) {
    var index = books.indexWhere((b) => b.id == id);
    if (index != -1) {
      if (!books[index].isBorrowed) {
        books[index].isBorrowed = true;
        _saveBooks();
        print('Livro emprestado com sucesso!');
      } else {
        print('O livro já está emprestado.');
      }
    } else {
      print('Livro não encontrado.');
    }
  }

  void returnBook(String id) {
    var index = books.indexWhere((b) => b.id == id);
    if (index != -1) {
      if (books[index].isBorrowed) {
        books[index].isBorrowed = false;
        _saveBooks();
        print('Livro devolvido com sucesso!');
      } else {
        print('O livro não estava emprestado.');
      }
    } else {
      print('Livro não encontrado.');
    }
  }

  void removeBook(String id) {
    var index = books.indexWhere((b) => b.id == id);
    if (index != -1) {
      books.removeAt(index);
      _saveBooks();
      print('Livro removido com sucesso!');
    } else {
      print('Livro não encontrado.');
    }
  }
}
