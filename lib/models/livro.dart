class Livro {
  String id;
  String titulo;
  String autor;
  bool emprestado;

  Livro(this.id, this.titulo, this.autor, {this.emprestado = false});

  String paraTexto() {
    return '$id;$titulo;$autor;$emprestado';
  }

  @override
  String toString() {
    return 'ID: $id | Título: $titulo | Autor: $autor | Status: ${emprestado ? "Emprestado" : "Disponível"}';
  }
}
