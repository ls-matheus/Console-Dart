class Livro {
  String id;
  String titulo;
  String autor;
  bool emprestado = false;

  Livro(this.id, this.titulo, this.autor);

  String paraTexto() {
    return '$id;$titulo;$autor;$emprestado';
  }

  String mostrar() {
    var status = 'Disponível';
    if (emprestado) {
      status = 'Emprestado';
    }
    return 'ID: $id | Título: $titulo | Autor: $autor | Status: $status';
  }
}
