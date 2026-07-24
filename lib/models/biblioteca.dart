import 'dart:io';
import 'livro.dart';

class BibliotecaApp {
  List<Livro> meusLivros = [];

  BibliotecaApp() {
    carregarLivros();
  }

  void carregarLivros() {
    var arquivo = File('Cache/livros.txt');
    if (arquivo.existsSync()) {
      var linhas = arquivo.readAsLinesSync();
      for (var linha in linhas) {
        var partes = linha.split(';');
        if (partes.length == 4) {
          var livro = Livro(partes[0], partes[1], partes[2]);
          livro.emprestado = partes[3] == 'true';
          meusLivros.add(livro);
        }
      }
    }
  }

  void salvarLivros() {
    var pasta = Directory('Cache');
    if (!pasta.existsSync()) {
      pasta.createSync();
    }
    var arquivo = File('Cache/livros.txt');
    var texto = '';
    for (var livro in meusLivros) {
      texto += livro.paraTexto() + '\n';
    }
    arquivo.writeAsStringSync(texto);
  }

  void cadastrar(Livro livro) {
    meusLivros.add(livro);
    salvarLivros();
    print('Livro "${livro.titulo}" cadastrado com sucesso!');
  }

  void listar() {
    if (meusLivros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }
    for (var livro in meusLivros) {
      print(livro);
    }
  }

  void buscar(String nome) {
    var achou = false;
    for (var livro in meusLivros) {
      if (livro.titulo.toLowerCase().contains(nome.toLowerCase())) {
        print(livro);
        achou = true;
      }
    }
    if (!achou) {
      print('Livro não encontrado.');
    }
  }

  int acharPosicao(String cod) {
    for (var i = 0; i < meusLivros.length; i++) {
      if (meusLivros[i].id == cod) {
        return i;
      }
    }
    return -1;
  }

  void fazerEmprestimo(String cod) {
    var pos = acharPosicao(cod);
    if (pos != -1) {
      if (!meusLivros[pos].emprestado) {
        meusLivros[pos].emprestado = true;
        salvarLivros();
        print('Livro emprestado com sucesso!');
      } else {
        print('O livro já está emprestado.');
      }
    } else {
      print('Livro não encontrado.');
    }
  }

  void devolver(String cod) {
    var pos = acharPosicao(cod);
    if (pos != -1) {
      if (meusLivros[pos].emprestado) {
        meusLivros[pos].emprestado = false;
        salvarLivros();
        print('Livro devolvido com sucesso!');
      } else {
        print('O livro não estava emprestado.');
      }
    } else {
      print('Livro não encontrado.');
    }
  }

  void apagar(String cod) {
    var pos = acharPosicao(cod);
    if (pos != -1) {
      meusLivros.removeAt(pos);
      salvarLivros();
      print('Livro removido com sucesso!');
    } else {
      print('Livro não encontrado.');
    }
  }
}
