import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/exam_questions_screen.dart';
import 'package:online_exam_app_v5/presentation/utilities/result_to_total.dart';
import 'package:online_exam_app_v5/presentation/utilities/score_circle.dart';
import 'package:online_exam_app_v5/presentation/utilities/solved_exam_results.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScoreScreen extends StatelessWidget {
  static const String routeName = "ExamScoreScreen";

  ExamScoreScreen();

  @override
  Widget build(BuildContext context) {

    var result =
        ModalRoute.of(context)?.settings.arguments as SolvedExamResults;
    int? myScore = result.correctAnswers;
    int? totalScore = result.totalQuestions;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CircularPercentIndicator(
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
                ),
                Expanded(
                  child: Container(

                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width:MediaQuery.of(context).size.width*0.8,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text('Show Result',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:AppThemeData.primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: AppThemeData.primaryColor)
                          )
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  width:MediaQuery.of(context).size.width*0.8,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context,ExamQuestionsScreen.routeName,arguments: result.examData);
                      },
                      child: Text('Start again',style: TextStyle(
                          color: AppThemeData.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: AppThemeData.primaryColor)
                          )
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
