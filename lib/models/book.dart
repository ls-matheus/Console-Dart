class Book {
  String id;
  String title;
  String author;
  bool isBorrowed;

  Book(this.id, this.title, this.author, {this.isBorrowed = false});

  @override
  String toString() {
    return 'ID: $id | Título: $title | Autor: $author | Emprestado: ${isBorrowed ? "Sim" : "Não"}';
  }
}
