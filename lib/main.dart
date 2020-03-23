import 'package:flutter/material.dart';
import 'package:perguntas/resultado.dart';
import 'package:perguntas/questionario.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  final _perguntas = const [
    {
      'texto': 'Qual sua Cor Favorita ?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 2},
        {'texto': 'Verde', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual seu seu Animal Favorito ?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 2},
        {'texto': 'Peixe', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual seu time de Futebol ?',
      'respostas': [
        {'texto': 'Grêmio', 'pontuacao': 10},
        {'texto': 'Internacional', 'pontuacao': 5},
        {'texto': 'Chapecoense', 'pontuacao': 2},
        {'texto': 'Santos', 'pontuacao': 0},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(_perguntas, _perguntaSelecionada, _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
