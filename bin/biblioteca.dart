import 'dart:io';
import '../lib/models/livro.dart';
import '../lib/models/biblioteca.dart';

void limparTela() {
  print('\x1B[2J\x1B[0;0H');
}

void main() {
  var sistema = BibliotecaApp();
  var rodando = true;

  while (rodando) {
    limparTela();
    print('=====================================');
    print('       SISTEMA DE BIBLIOTECA         ');
    print('=====================================');
    print('[ 1 ] Cadastrar livro');
    print('[ 2 ] Listar livros');
    print('[ 3 ] Pesquisar livro pelo título');
    print('[ 4 ] Emprestar livro');
    print('[ 5 ] Devolver livro');
    print('[ 6 ] Remover livro');
    print('[ 0 ] Sair');
    print('=====================================');
    stdout.write('Escolha uma opção: ');

    var opcao = stdin.readLineSync();
    var espera = true;

    switch (opcao) {
      case '1':
        print('Digite o ID:');
        var id = stdin.readLineSync() ?? '';
        print('Digite o Título:');
        var tit = stdin.readLineSync() ?? '';
        print('Digite o Autor:');
        var aut = stdin.readLineSync() ?? '';
        if (id.isNotEmpty && tit.isNotEmpty && aut.isNotEmpty) {
          sistema.cadastrar(Livro(id, tit, aut));
        } else {
          print('Dados inválidos.');
        }
        break;
      case '2':
        sistema.listar();
        break;
      case '3':
        print('Digite o título:');
        var tit = stdin.readLineSync() ?? '';
        sistema.buscar(tit);
        break;
      case '4':
        print('Digite o ID do livro para emprestar:');
        var id = stdin.readLineSync() ?? '';
        sistema.fazerEmprestimo(id);
        break;
      case '5':
        print('Digite o ID do livro para devolver:');
        var id = stdin.readLineSync() ?? '';
        sistema.devolver(id);
        break;
      case '6':
        print('Digite o ID do livro para remover:');
        var id = stdin.readLineSync() ?? '';
        sistema.apagar(id);
        break;
      case '0':
        rodando = false;
        espera = false;
        print('Saindo...');
        break;
      default:
        print('Opção inválida.');
        espera = false;
    }

    if (rodando && espera) {
      sleep(Duration(seconds: 5));
    }
  }
}
