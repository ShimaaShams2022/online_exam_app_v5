import 'package:flutter/material.dart';

class ExamHeader extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;


  ExamHeader({
    required this.questionNumber,
    required this.totalQuestions,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question $questionNumber of $totalQuestions',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}