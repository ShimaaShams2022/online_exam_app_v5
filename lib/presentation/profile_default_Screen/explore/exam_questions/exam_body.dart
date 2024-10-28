import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/question_widget.dart';

import '../../../../data/api/model/response/Questions.dart';
import 'exam_header.dart';
import 'exam_score_screen.dart';

class ExamScreenBody extends StatefulWidget {
  final List<Questions>? questions;

  ExamScreenBody({required this.questions});

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreenBody> {
  int currentQuestionIndex = 0;
  Map<int, String> userAnswers = {};
  List<bool> userAnswersChecked=[];
  int correctAnswerCount=0;


  void _onAnswerChecked(String answerKey, bool isCorrect) {
    userAnswersChecked.add(isCorrect);
  }




  void _nextQuestion() {
    if (currentQuestionIndex < (widget.questions?.length )!- 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showSubmitDialog();
    }
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do you want submit?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); //
                _navigateToScoreScreen();
              },
              child: Text('yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); //
              },
              child: Text('no'),
            ),
          ],
        );
      },
    );
  }
  void _navigateToScoreScreen() {
    int correctCount = userAnswersChecked.where((answer) => answer).length;
    Navigator.pushNamed(context,ExamScoreScreen.routeName,arguments: correctCount);
  }

  void _prevQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }

  void _saveAnswer(String answer) {
    setState(() {
      userAnswers[currentQuestionIndex] = answer;
      print(userAnswers);
    });
  }

  @override
  Widget build(BuildContext context) {


    final question = widget.questions?[currentQuestionIndex];

    return Container(
      padding: EdgeInsets.all(20),
      margin:EdgeInsets.all(10) ,
      child: Column(
          children: [
            ExamHeader(questionNumber:currentQuestionIndex+1, totalQuestions: widget.questions!.length),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.questions!.length,
            ),
            SizedBox(height:40),
            Expanded(
              flex: 4,
              child: QuestionWidget(
                currentQuestion: question,
                selectedAnswer: userAnswers[currentQuestionIndex],
                onAnswerSelected:_saveAnswer,
                onAnswerChecked:_onAnswerChecked

              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width*0.4,
                    child: ElevatedButton(
                      onPressed: _prevQuestion,
                      child: Text('Back',style: TextStyle(
                        color: AppThemeData.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppThemeData.primaryColor)
                        )
                      )
                    ),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width*0.4,
                    child: ElevatedButton(
                      onPressed: _nextQuestion,
                      child: Text('Next',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:AppThemeData.primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: AppThemeData.primaryColor)
                            )
                        )
                    ),
                  ),
                ],
              ),
            ),
      
          ],
        ),
    );

  }
}