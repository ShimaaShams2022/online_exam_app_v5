import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/question_widget.dart';
import 'package:online_exam_app_v5/presentation/utilities/result_to_total.dart';
import 'package:online_exam_app_v5/presentation/utilities/solved_exam_results.dart';

import '../../../../data/api/model/response/Questions.dart';
import '../../../utilities/exam_data.dart';
import 'exam_header.dart';
import 'exam_score_screen.dart';

class ExamScreenBody extends StatefulWidget {
  final ExamData examData;
  final List<Questions>? questions;
  final Duration examDuration;

  ExamScreenBody({required this.questions,required this.examData, required this.examDuration});

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreenBody> {
  int currentQuestionIndex = 0;
  Map<int, String> userAnswers = {};
  List<bool> userAnswersChecked = [];
  int correctAnswerCount = 0;
  late Timer? _timer;
  late Duration remainingTime;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.examDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime = remainingTime - Duration(seconds: 1);
        } else {
          _timer?.cancel();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/sand_timer.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Time out !!",
                      style: TextStyle(
                          color: AppThemeData.errorColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); //
                            _navigateToScoreScreen();
                          },
                          child: Text(
                            'View score',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppThemeData.primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  side: BorderSide(
                                      color: AppThemeData.primaryColor)))),
                    ),
                  ),
                ],
              );
            },
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onAnswerChecked(String answerKey, bool isCorrect) {
    userAnswersChecked.add(isCorrect);
  }

  void _nextQuestion() {
    if (currentQuestionIndex < (widget.questions?.length)! - 1) {
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
    int? totalQuestions = widget.questions?.length;
    SolvedExamResults solvedExamResults = SolvedExamResults(
        examData: widget.examData,
        userAnswers: userAnswers,
        totalQuestions: totalQuestions,
        correctAnswers: correctCount,
        questions: widget.questions);


    Navigator.pushReplacementNamed(context, ExamScoreScreen.routeName,
        arguments: solvedExamResults);
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
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ExamHeader(
              questionNumber: currentQuestionIndex + 1,
              totalQuestions: widget.questions!.length),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / widget.questions!.length,
          ),
          SizedBox(height: 40),
          Expanded(
            flex: 4,
            child: QuestionWidget(
                currentQuestion: question,
                selectedAnswer: userAnswers[currentQuestionIndex],
                onAnswerSelected: _saveAnswer,
                onAnswerChecked: _onAnswerChecked),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      onPressed: _prevQuestion,
                      child: Text(
                        'Back',
                        style: TextStyle(
                            color: AppThemeData.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: AppThemeData.primaryColor)))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      onPressed: _nextQuestion,
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeData.primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: AppThemeData.primaryColor)))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
