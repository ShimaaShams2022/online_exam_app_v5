import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/result/result_screen.dart';

class Subject_result_widget extends StatelessWidget {
  ExamResult examResultSubject ;
   Subject_result_widget({super.key, required this.examResultSubject});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,)
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              examResultSubject.imageUrl,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [

                        Text(examResultSubject.title),


                    Text(examResultSubject.numberOfQuestions.toString() + '  Questions'),
                    SizedBox(height: 20,),
                    Text('hhhhhh',style: TextStyle(color: Colors.blue),)





                  ],),
                SizedBox(width: 50,),

                Text(examResultSubject.duration.toString()+" minutes")
              ],
            )


          ],
        ));
  }
}
