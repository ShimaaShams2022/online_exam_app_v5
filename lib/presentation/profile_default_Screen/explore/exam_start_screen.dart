import 'package:flutter/material.dart';

class Exam_Start_Screen extends StatelessWidget {

  static const String routeName = "Exam_Start_Screen";
  const Exam_Start_Screen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Back button functionality here
            },
          ),
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
                      'Languages',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text("30 min")
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'High level | 20 Questions',
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
                        // Start button functionality here
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
