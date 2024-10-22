import 'package:flutter/material.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/search_widget.dart';

import '../../../domain/models/user.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  static const String routeName = "ExploreScreen";
TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SearchWidget(
              controller: searchController,
              onSearch:(query){
                print("search result for $query");
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Browse By Subject",style: AppThemeData.lightTheme.textTheme.headlineSmall,),
        ),
        Container(
          child: Row(
            children: [
              Image.asset("assets/images/icon_exam.png"),
              Text("Language",style: AppThemeData.lightTheme.textTheme.titleSmall,)
            ],
          ),
        )

      ],
    );
  }
}
