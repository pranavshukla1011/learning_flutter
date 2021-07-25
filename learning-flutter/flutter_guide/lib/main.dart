import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions = [
    {
      'question': 'Instagram',
      'answers': ['facebook', 'google', 'netflix', 'logitech'],
    },
    {
      'question': 'Whatsapp',
      'answers': ['google', 'netflix', 'logitech', 'facebook'],
    },
    {
      'question': 'Moviews',
      'answers': [
        'logitech',
        'facebook',
        'google',
        'netflix',
      ],
    },
    {
      'question': 'Mouse',
      'answers': [
        'netflix',
        'logitech',
        'facebook',
        'google',
      ],
    }
  ];

  void onPressedFunc() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex > questions.length - 1) {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My App',
          ),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['question']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((item) {
              return Answer(
                text: item,
                onPressed: onPressedFunc,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
