import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/data/api/model/response/Questions.dart';

import '../../utilities/solved_exam_results.dart';


class OneExamResult extends StatelessWidget {
  static const String routeName = "OneExamResult";

  const OneExamResult({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the solved exam information
    var solvedExamInformation =
    ModalRoute.of(context)?.settings.arguments as SolvedExamResults;

    // Retrieve the questions
    List<Questions>? questions = solvedExamInformation.questions ?? [];

    // Convert userAnswers map to a list
     var userAnswers =solvedExamInformation.userAnswers ?? {};
   // Initialize a list with nulls



    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Results"),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          // Get each question's data
          final question = questions[index].question;
          final userAnswer = userAnswers[index];
          print(userAnswer);
          final correctAnswer = questions[index].correct;
     print(correctAnswer);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display question text
                    Text(
                      question ?? "",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),

                    // Display each option with color-coding based on correctness
                    Column(
                      children: List.generate(questions[index].answers?.length ?? 0, (optionIndex) {
                        final optionText = questions[index].answers?[optionIndex].key;
                       var optionTextString=questions[index].answers?[optionIndex].answer;
                        print(optionTextString);
                        bool isUserAnswer = optionText == userAnswer;
                        bool isCorrectAnswer = optionText == correctAnswer;

                        // Set colors based on correctness
                        Color optionColor;
                        if (isCorrectAnswer) {
                          optionColor = Colors.green.withOpacity(0.2);
                        } else if (isUserAnswer && !isCorrectAnswer) {
                          optionColor = Colors.red.withOpacity(0.2);
                        } else {
                          optionColor = Colors.transparent;
                        }

                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: optionColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isUserAnswer ? Colors.blue : Colors.grey,
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(
                              isCorrectAnswer
                                  ? Icons.check_circle
                                  : isUserAnswer
                                  ? Icons.cancel
                                  : Icons.circle_outlined,
                              color: isCorrectAnswer
                                  ? Colors.green
                                  : isUserAnswer
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            title: Text(optionTextString ?? ""),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}