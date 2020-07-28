import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';
import './questionario.dart';

//parado na aula 49, app quebrou e fui estudar dart
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

  @override
  Widget build(BuildContext context) {
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
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}
