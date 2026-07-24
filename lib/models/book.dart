class Book {
  String id;
  String title;
  String author;
  bool isBorrowed;

  Book(this.id, this.title, this.author, {this.isBorrowed = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'isBorrowed': isBorrowed,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      map['id'],
      map['title'],
      map['author'],
      isBorrowed: map['isBorrowed'] ?? false,
    );
  }

  @override
  String toString() {
    return 'ID: $id | Título: $title | Autor: $author | Emprestado: ${isBorrowed ? "Sim" : "Não"}';
  }
}
