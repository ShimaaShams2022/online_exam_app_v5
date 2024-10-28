import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/exam_questions_screen.dart';

import '../../../utilities/exam_data.dart';

class ExamStartScreen extends StatelessWidget {

  static const String routeName = "Exam_Start_Screen";
  const ExamStartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final examDataForSubject = ModalRoute.of(context)?.settings.arguments as ExamData;
    return Scaffold(
        appBar: AppBar(
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      examDataForSubject.subjectName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text("${examDataForSubject.examData.duration} min")
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '${examDataForSubject.examData.title} | ${examDataForSubject.examData.numberOfQuestions} Questions',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 32),
                Text(
                  'Instructions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.',
                  style: TextStyle(fontSize: 16),
                ),
               SizedBox(height: 50,),
                Center(
                  child: SizedBox(width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ExamQuestionsScreen.routeName,arguments: examDataForSubject);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            )));
  }
}
