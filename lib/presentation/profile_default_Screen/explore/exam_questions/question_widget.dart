import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';

import '../../../../data/api/model/response/Questions.dart';

class QuestionWidget extends StatelessWidget {
  final Questions? currentQuestion;
  final String? selectedAnswer;
  final ValueChanged<String> onAnswerSelected;
  final Function(String, bool) onAnswerChecked;

  QuestionWidget({
    required this.currentQuestion,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    required this.onAnswerChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentQuestion?.question ?? "",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ...?currentQuestion?.answers?.map((option) {
          final isCorrect = option.key == currentQuestion?.correct;
          final isSelected=selectedAnswer==option.key;
          
          return Container(
            margin: EdgeInsets.only(bottom: 10,top: 10),
            decoration:BoxDecoration(
              color: isSelected? AppThemeData.selectBottomNavigationBox: AppThemeData. bottomNavigationBackground,
              border: Border.all(
                color: isSelected? AppThemeData.selectBottomNavigationBox: AppThemeData. bottomNavigationBackground,
                width: 2
              ),
              borderRadius: BorderRadius.circular(10)
            ) ,
            child: RadioListTile<String>(
              title: Text(option.answer ?? ''),
              value: option.key ?? '',
              groupValue: selectedAnswer,
              onChanged: (value) {
                if (value != null) {
                  onAnswerSelected(value);
                  onAnswerChecked(value, isCorrect);
                }
              },
            ),
          );
        })
      ],
    );
  }
}
