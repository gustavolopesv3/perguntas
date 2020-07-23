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
    final perguntas = [
      'qual sua cor favorita?',
      'qual seu animal favorito?',
      'voce gosta de  bolo?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Perguntas')),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]),
            Resposta('Resposta1', _responder),
            Resposta('Resposta2', _responder),
            Resposta('Resposta3', _responder),
          ],
        ),
      ),
    );
  }
}
