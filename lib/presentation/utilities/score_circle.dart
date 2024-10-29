import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {

  String label;
  int score;
  Color color;

   ScoreCircle({
     required this.label,
     required this.color,
     required this.score,

     super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ Text(
        label,
        style: TextStyle(color: color, fontSize: 18),
      ),
        SizedBox(width: 10),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: color,width: 1)
          ),
          alignment: Alignment.center,
          child: Text(
            '$score',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color),
          ),
        ),


      ],
    );
  }
}
