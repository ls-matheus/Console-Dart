class Livro {
  String id;
  String titulo;
  String autor;
  bool emprestado;

  Livro(this.id, this.titulo, this.autor, {this.emprestado = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'emprestado': emprestado,
    };
  }

  factory Livro.fromMap(Map<String, dynamic> map) {
    return Livro(
      map['id'],
      map['titulo'],
      map['autor'],
      emprestado: map['emprestado'] ?? false,
    );
  }

  @override
  String toString() {
    return 'ID: $id | Título: $titulo | Autor: $autor | Emprestado: ${emprestado ? "Sim" : "Não"}';
  }
}
