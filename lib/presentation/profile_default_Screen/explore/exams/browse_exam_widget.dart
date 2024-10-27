import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exams/exam_start_screen.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exams/exams_screen.dart';
import 'package:online_exam_app_v5/presentation/utilities/subject_data.dart';

import '../../../../data/api/model/response/Exams.dart';
import '../../../utilities/exam_data.dart';


class BrowseExamWidget extends StatelessWidget {
  BrowseExamWidget(
      {required this.userToken,
        required this.examData,
        required this.subjectName,

        super.key});

  Exams? examData;
  String? userToken;
  String? subjectName;





  @override
  Widget build(BuildContext context) {

    ExamData examDataForSubject=ExamData(userToken!, subjectName!, examData!);

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ExamStartScreen.routeName,arguments: examDataForSubject);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/images/exam_icon.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(examData?.title??""),
                Text("${examData?.numberOfQuestions.toString()} Questions"),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("From: 1.00"),
                  SizedBox(width: 10),
                  Text("To: 6.00"),
                ],
              )
              ],
            ),
            SizedBox(width: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("${examData?.duration.toString()} min")
              ],
            )
          ],
        ),
      ),
    );
  }
}
