import 'package:flutter/material.dart';

import '../../app_theme/app_theme_data.dart';

class BrowseSubjectWidget extends StatelessWidget {
   BrowseSubjectWidget({
     required this.iconImageName,
   required this.subjectName,
     super.key});

  String? iconImageName;
  String? subjectName;

  @override
  Widget build(BuildContext context) {
    return  Container(
margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0,2)
            )
          ]
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("assets/images/$iconImageName"),
          ),
          Text(subjectName!,style: AppThemeData.lightTheme.textTheme.bodyMedium,)
        ],
      ),
    );
  }
}
