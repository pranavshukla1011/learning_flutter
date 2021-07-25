import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(30),
    );
  }
}
