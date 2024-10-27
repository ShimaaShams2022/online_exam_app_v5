import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/result/subject_result_widget.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  static const String routeName = "ResultScreen";

  List<ExamResult> examResultList =[
    ExamResult('assets/images/icon_exam.png', 'highlevel', 30, 'math', 30),

    ExamResult('assets/images/icon_exam.png', 'highlevel', 30, 'math', 30),

    ExamResult('assets/images/icon_exam.png', 'highlevel', 30, 'math', 30)




  ];

  @override
  Widget build(BuildContext context) {
    return  Container(

      margin: EdgeInsets.only(top: 8,bottom: 8),
      padding:EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(itemCount:examResultList.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context,index)=>SizedBox(height: 10,),
              itemBuilder: (context,index){
                return Subject_result_widget(examResultSubject: examResultList[index],);
              },
            ),
          ),
        ],
      ),
    );
  }
}
class ExamResult
{ String imageUrl ;
String title;
int duration;
String subject ;
int numberOfQuestions;
ExamResult(this.imageUrl,this.title,this.duration,this.subject,this.numberOfQuestions);
}



