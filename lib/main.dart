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

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPeguntaselecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPeguntaselecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPeguntaselecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;
    List<Widget> widgetsResp =
        respostas.map((txt) => Resposta(txt, _responder)).toList();

    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Perguntas')),
        ),
        body: temPeguntaselecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto']),
                  ...widgetsResp
                ],
              )
            : Center(
                child: Text('parabens'),
              ),
      ),
    );
  }
}
