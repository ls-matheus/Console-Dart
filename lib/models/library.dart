import 'book.dart';

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
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
      print('Livro removido com sucesso!');
    } else {
      print('Livro não encontrado.');
    }
  }
}
