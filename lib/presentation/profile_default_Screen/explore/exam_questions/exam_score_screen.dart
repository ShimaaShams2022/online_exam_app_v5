import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/utilities/result_to_total.dart';
import 'package:online_exam_app_v5/presentation/utilities/score_circle.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScoreScreen extends StatelessWidget {
  static const String routeName = "ExamScoreScreen";

  ExamScoreScreen();

  @override
  Widget build(BuildContext context) {
    var resultToTotal =
        ModalRoute.of(context)?.settings.arguments as ResultToTotal;
    int? myScore = resultToTotal.correctAnswers;
    int? totalScore = resultToTotal.totalQuestions;
    double percentage = myScore! / totalScore!;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Exam Result',
        style: AppThemeData.lightTheme.textTheme.headlineMedium,
      )),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Score",
                style: AppThemeData.lightTheme.textTheme.headlineSmall),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 10.0,
                  animation: true,
                  percent: percentage,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(percentage * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: AppThemeData.errorColor,
                  progressColor: AppThemeData.primaryColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScoreCircle(
                        label: 'Correct',
                        color: AppThemeData.primaryColor,
                        score: myScore),
                    SizedBox(height: 20,),
                    ScoreCircle(
                        label: 'Incorrect',
                        color: AppThemeData.errorColor,
                        score: totalScore - myScore),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
