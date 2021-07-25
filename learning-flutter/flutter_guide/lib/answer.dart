import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // const Answer({Key? key}) : super(key: key);

  final VoidCallback onPressed;
  String text;

  Answer({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
