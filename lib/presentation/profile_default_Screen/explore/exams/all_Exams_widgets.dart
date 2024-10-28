import 'package:flutter/material.dart';

import '../../../../data/api/model/response/Exams.dart';
import 'browse_exam_widget.dart';


class AllExamsWidget extends StatelessWidget {
   AllExamsWidget(
      {
        required this.userToken,
        required this.allExams,
        required this.subjectName,
        super.key});

   List<Exams>? allExams;
   String userToken;
   String subjectName;


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
     shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:allExams?.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
        return BrowseExamWidget(examData: allExams![index], userToken:userToken, subjectName: subjectName,);
      },
    );
  }
}
