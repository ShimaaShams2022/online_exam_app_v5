import 'package:flutter/material.dart';

class ExamScoreScreen extends StatelessWidget {

  static const String routeName = "ExamScoreScreen";

  ExamScoreScreen();

  @override
  Widget build(BuildContext context) {
    var correctCount=ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: Text('Exam Result')),
      body: Center(
        child: Text('your score is: $correctCount'),
      ),
    );
  }
}