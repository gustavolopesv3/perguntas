import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual sua cor Favorita?',
        'respostas': ['Preto', 'Vermelho', 'Azul', 'Preto']
      },
      {
        'texto': 'Qual seu animal favorito?',
        'respostas': ['Cachorro', 'Gato', 'Papagaio', 'cobra']
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': ['Ze', 'Francisco', 'testivaldo', 'Maria do teste']
      },
    ];

    List<Widget> respostas = [];
    for (var textoResp in perguntas[_perguntaSelecionada]['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Perguntas')),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas
          ],
        ),
      ),
    );
  }
}
