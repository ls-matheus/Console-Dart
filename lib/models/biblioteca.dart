import 'dart:convert';
import 'dart:io';
import 'livro.dart';

class BibliotecaApp {
  List<Livro> meusLivros = [];
  final String arquivoDados = 'Cache/livros.txt';

  BibliotecaApp() {
    carregarArquivos();
  }

  void carregarArquivos() {
    var file = File(arquivoDados);
    if (file.existsSync()) {
      var texto = file.readAsStringSync();
      if (texto.isNotEmpty) {
        List<dynamic> listaJson = jsonDecode(texto);
        meusLivros = listaJson.map((item) => Livro.fromMap(item)).toList();
      }
    }
  }

  void salvarArquivos() {
    var pasta = Directory('Cache');
    if (!pasta.existsSync()) {
      pasta.createSync();
    }
    var file = File(arquivoDados);
    var listaJson = meusLivros.map((b) => b.toMap()).toList();
    file.writeAsStringSync(jsonEncode(listaJson));
  }

  void cadastrar(Livro l) {
    meusLivros.add(l);
    salvarArquivos();
    print('Livro "${l.titulo}" cadastrado com sucesso!');
  }

  void listar() {
    if (meusLivros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }
    for (var l in meusLivros) {
      print(l);
    }
  }

  void buscar(String nome) {
    var achados = meusLivros.where((b) => b.titulo.toLowerCase().contains(nome.toLowerCase())).toList();
    if (achados.isEmpty) {
      print('Livro não encontrado.');
      return;
    }
    for (var l in achados) {
      print(l);
    }
  }

  void fazerEmprestimo(String cod) {
    var pos = meusLivros.indexWhere((b) => b.id == cod);
    if (pos != -1) {
      if (!meusLivros[pos].emprestado) {
        meusLivros[pos].emprestado = true;
        salvarArquivos();
        print('Livro emprestado com sucesso!');
      } else {
        print('O livro já está emprestado.');
      }
    } else {
      print('Livro não encontrado.');
    }
  }

  void devolver(String cod) {
    var pos = meusLivros.indexWhere((b) => b.id == cod);
    if (pos != -1) {
      if (meusLivros[pos].emprestado) {
        meusLivros[pos].emprestado = false;
        salvarArquivos();
        print('Livro devolvido com sucesso!');
      } else {
        print('O livro não estava emprestado.');
      }
    } else {
      print('Livro não encontrado.');
    }
  }

  void apagar(String cod) {
    var pos = meusLivros.indexWhere((b) => b.id == cod);
    if (pos != -1) {
      meusLivros.removeAt(pos);
      salvarArquivos();
      print('Livro removido com sucesso!');
    } else {
      print('Livro não encontrado.');
    }
  }
}
